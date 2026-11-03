"""Generate shared-mobile accesses at reviewed placement/player consumers.

Only bytes shared by NPCs and projectiles are included. Goal/status/target
words are excluded; precise-coordinate reads have separate non-NPC recipes.
Original pointer declarations determine byte scaling. The receiver remains
local even when another call changes the current global object.
"""
import re
from pathlib import Path
from generate_header_field_rules import generate as header_fields, regex
from generate_word_access_rules import generate as storage, HEADER
from generate_current_alias_rules import rule
from generate_named_field_read_rules import generate as named_reads
from generate_named_field_write_rules import byte_rules, emit

HERE = Path(__file__).resolve().parent
FIELDS = {8: 'hit_points', 9: 'full_heading', 10: 'movement_flags',
          19: 'motion_flags', 20: 'attack_pitch', 21: 'animation_flags', 24: 'heading_flags'}
BITS = {'movement_flags': [(0, 4, 'tick_phase'), (4, 3, 'movement_mode')],
        'motion_flags': [(0, 7, 'speed'), (7, 1, 'gravity_flag')],
        'attack_pitch': [(3, 5, 'pitch')], 'heading_flags': [(0, 5, 'fine_heading')]}
# These are layout contracts established by the actual consumers and callers,
# not guesses from variable names. "tile" entries only name offset 22.
CONTEXTS = {
    'ai.c': [('build_object_placement_snapshot', 'object', 'ushort *', 'shared'),
             ('settle_mobile_to_immobile', 'object', 'ushort *', 'shared'),
             ('npc_ai_tick', 'player_rec', 'char *', 'tile'),
             ('npc_ai_default_tick', 'npc_rec', 'char *', 'shared'),
             ('reset_npc_path_cache', 'iVar1', 'char *', 'shared')],
    'object_actions.c': [('check_object_drop_height', 'object', 'ushort *', 'shared'),
                         ('spawn_random_variant_object_at_tile', 'iVar4', 'char *', 'shared')],
    'objects.c': [('settle_dropped_object', 'mobile', 'uw_mobile_object_t *', 'shared'),
                  ('reallocate_object_to_arena', 'puVar2', 'ushort *', 'shared')],
    'collision.c': [('build_collision_height_field_for_object', 'object', 'ushort *', 'tile'),
                    ('collision_height_envelope', 'puVar7', 'ushort *', 'shared')],
    'combat.c': [('apply_melee_damage', 'puVar6', 'ushort *', 'shared'),
                 ('apply_object_durability_damage', 'object', 'ushort *', 'shared'),
                 ('resolve_collision_candidate_interaction', 'puVar4', 'ushort *', 'shared')],
    'input.c': [('begin_directional_move', 'g_player_object', 'uw_mobile_object_t *', 'shared')],
    'interact.c': [('pick_object_under_cursor', 'puVar3', 'ushort *', 'shared')],
    'game.c': [('set_custom_view_target', 'iVar1', 'void *', 'tile')],
    'automap.c': [('automap_reveal_byte', 'pp', 'ushort *', 'tile')],
    'demomode.c': [('demomode_pump', 'pl', 'unsigned short *', 'tile')],
    'tmap.c': [('process_visible_tile_cell', '_dpp', 'ushort *', 'tile'),
               ('emit_tile_features', 'puVar5', 'ushort *', 'tile')],
    'traps.c': [('apply_poison_or_damage_trap_effect', 'iVar2', 'void *', 'tile')],
}


def access_rules(entries):
    parts = []
    for index, (function, pointer, typ, extent) in enumerate(entries):
        scope = regex([function])
        parts.append(storage(pointer, {22: 'tile_position'}, scope, raw_type=typ).replace('uw_object_hdr_t', 'uw_mobile_object_t').replace('@w_', f'@site_{index}_w_'))
        if function == 'demomode_pump':
            parts.append(rule(function, pointer, 'tile_division_index', [f'{pointer}[0x16/2]'], f'((uw_mobile_object_t *){pointer})->tile_position'))
        if extent == 'tile':
            continue
        parts.append(header_fields(dict(functions=[dict(function=function, roles=[dict(name=pointer, type=typ)])])))
        parts[-1] = parts[-1].replace('@field_', f'@site_{index}_field_')
        parts.append(storage(pointer, HEADER, scope, raw_type=typ).replace('@w_', f'@site_{index}_header_w_'))
        if typ == 'uw_mobile_object_t *':
            parts.append(rule(function, pointer, 'typed_header_receiver',
                              [f'((uw_object_hdr_t *){pointer})->M'],
                              f'{pointer}->hdr.M').replace('@@\n', 'identifier M;\n@@\n'))
        byte_arithmetic = typ in ['char *', 'byte *', 'void *', 'unsigned char *']
        word_arithmetic = typ in ['ushort *', 'unsigned short *', 'short *']
        for off, field in FIELDS.items():
            access = f'((uw_mobile_object_t *){pointer})->{field}'
            for ctype in ['byte', 'undefined1', 'char']:
                forms = [f'*({ctype} *)((char *){pointer} + {hex(off)})']
                if byte_arithmetic:
                    forms.append(f'*({ctype} *)({pointer} + {hex(off)})')
                    if typ == 'char *' and ctype == 'char': forms.append(f'{pointer}[{hex(off)}]')
                if word_arithmetic and off % 2 == 0:
                    forms += [f'*({ctype} *)({pointer} + {hex(off//2)})', f'({ctype}){pointer}[{hex(off//2)}]']
                if ctype == 'char':
                    lvalues = [v for v in forms if not v.startswith('(char)')]
                    parts.append(rule(function, pointer, field+'_address', ['&'+v for v in lvalues], '(char *)&'+access))
                    parts.append(rule(function, pointer, field+'_store', [v+' = E;' for v in lvalues], access+' = (byte)E;', True))
                parts.append(rule(function, pointer, field+'_'+ctype, forms, ('(char)' if ctype == 'char' else '')+access))
    return '\n'.join(parts)


def bit_rules(entries):
    parts = []
    # Match only the proven cast receiver, never another movement_flags member
    # (e.g. a monster-table row) within the same function.
    template = named_reads({}, BITS)
    chunks = re.findall(r'@([^@]+)@\n([\s\S]*?)\n@@\n([\s\S]*?)(?=\n@|\Z)', template)
    for index, (function, pointer, _, extent) in enumerate(entries):
        if extent == 'tile': continue
        for key, meta, body in chunks:
            if 'B->' not in body: continue
            meta = meta.replace('expression B;','')
            body = body.replace('B->', f'((uw_mobile_object_t *){pointer})->')
            parts.append(f'@site_{index}_{key}@\ntype R;\nidentifier F =~ "{regex([function])}";\ntypedef byte, uw_mobile_object_t;\n{meta}\n@@\nR F(...) {{\n<...\n{body}\n...>\n}}\n')
    return '\n'.join(parts)


def precise_rules():
    parts = []
    for i, axis in enumerate('xyz'):
        parts.append(rule('build_object_placement_snapshot', 'object', 'precise_'+axis,
                          [f'*(undefined2 *)((char *)object + {hex(11+i*2)})'],
                          f'((uw_projectile_object_t *)object)->precise_{axis}').replace('ushort, uw_mobile_object_t;', 'ushort, uw_mobile_object_t, uw_projectile_object_t;'))
    parts.append(rule('settle_mobile_to_immobile', 'object', 'source_slot', ['(byte)object[9]'],
                      '((uw_projectile_object_t *)object)->source_slot').replace('ushort, uw_mobile_object_t;', 'ushort, uw_mobile_object_t, uw_projectile_object_t;'))
    parts.append(rule('reallocate_object_to_arena', 'puVar2', 'debug_precise_z', ['*(short *)((char *)puVar2 + 0xf)'],
                      '(short)((uw_projectile_object_t *)puVar2)->precise_z').replace('ushort, uw_mobile_object_t;', 'ushort, uw_mobile_object_t, uw_projectile_object_t;'))
    # emit_tile_features reaches this read only for an arena mobile whose
    # item class is not NPC (0x40); its coordinate is a signed world height.
    parts.append(rule('emit_tile_features', 'puVar5', 'precise_z', ['*(short *)((char *)puVar5 + 0xf)'],
                      '(short)((uw_projectile_object_t *)puVar5)->precise_z').replace('ushort, uw_mobile_object_t;', 'ushort, uw_mobile_object_t, uw_projectile_object_t;'))
    return '\n'.join(parts)


def coordinate_rules(entries):
    """Retain tile-to-position scaling without reassembling the tile word."""
    parts = []
    for function, pointer, _, _ in entries:
        base = f'((uw_mobile_object_t *){pointer})->tile_position'
        for field, shift, mask in [('tile_x', 7, 0xfc00), ('tile_y', 1, 0x3f0)]:
            forms = [f'({base} & {hex(mask)}) >> {shift}',
                     f'({base} >> {shift}) & 0x1f8']
            native_shift = 10 if field == 'tile_x' else 4
            positioned = f'((uw_mobile_object_t *){pointer})->{field} << {native_shift}'
            forms += ['(' * depth + positioned + ')' * depth + f' >> {shift}' for depth in [1, 2]]
            parts.append(rule(function, pointer, field+'_scaled', forms,
                              f'(((uw_mobile_object_t *){pointer})->{field} << 3)'))
    return '\n'.join(parts)


def shared_write_rules():
    rules = []
    expressions = []
    for byte, fields in BITS.items():
        for shift, width, field in fields:
            prefix = '((uw_mobile_object_t *)P)->'
            base = byte_rules('shared_'+field, prefix + byte, prefix + field, shift, width)
            rules += base
            # Each operand is a scalar identifier or numeric literal. Calls,
            # dereferences and repeated memory expressions cannot match.
            for index, value in enumerate(['(H & C) + D', '(H & C) + N', 'H << C']):
                variants = []
                for key, before, after in base:
                    if '_xor_' not in key: continue
                    before = re.sub(r'\bH\b', '(' + value + ')', before)
                    after = re.sub(r'\bH\b', '(' + value + ')', after)
                    variants.append('- ' + before + '\n+ ' + after)
                    lhs, rhs = before[:-1].split(' = ', 1)
                    first, last = rhs.rsplit(' ^ ', 1)
                    variants.append('- ' + lhs + ' = (' + first + ') ^ ' + last + ';\n+ ' + after)
                identifiers = 'P, H, N' if index == 1 else 'P, H'
                constants = 'C =~ "^[0-9]", D =~ "^[0-9]"' if index == 0 else 'C =~ "^[0-9]"'
                expressions.append(f'''@shared_{field}_expression_{index} disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier {identifiers};
constant {constants};
typedef uw_mobile_object_t;
@@
(
''' + '\n|\n'.join(variants) + '\n)\n')
    return emit(rules) + '\n'.join(expressions)


if __name__ == '__main__':
    out = HERE / 'shared-mobile'
    out.mkdir(exist_ok=True)
    for filename, entries in CONTEXTS.items():
        (out / (filename+'.cocci')).write_text(access_rules(entries))
        (out / (filename+'.bits.cocci')).write_text(bit_rules(entries))
        (out / (filename+'.coordinates.cocci')).write_text(coordinate_rules(entries))
    (out / 'precise.cocci').write_text(precise_rules())
    (out / 'writes.cocci').write_text(shared_write_rules())
