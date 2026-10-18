@promoted_type_flags_object_id_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->type_flags >> 0) & 0x1ff
+ (int)B->object_id
|
- ((int)B->type_flags & 0x1ff) >> 0
+ (int)B->object_id
|
- (int)B->type_flags & 0x1ff
+ (int)B->object_id
|
- ((int)B->type_flags >> 0) & 0x1ffU
+ (uint)B->object_id
|
- ((int)B->type_flags & 0x1ffU) >> 0
+ (uint)B->object_id
|
- (int)B->type_flags & 0x1ffU
+ (uint)B->object_id
|
- ((uint)B->type_flags >> 0) & 0x1ff
+ (uint)B->object_id
|
- ((uint)B->type_flags & 0x1ff) >> 0
+ (uint)B->object_id
|
- (uint)B->type_flags & 0x1ff
+ (uint)B->object_id
|
- ((uint)B->type_flags >> 0) & 0x1ffU
+ (uint)B->object_id
|
- ((uint)B->type_flags & 0x1ffU) >> 0
+ (uint)B->object_id
|
- (uint)B->type_flags & 0x1ffU
+ (uint)B->object_id
|
- ((int)B->type_flags_signed >> 0) & 0x1ff
+ (int)B->object_id
|
- ((int)B->type_flags_signed & 0x1ff) >> 0
+ (int)B->object_id
|
- (int)B->type_flags_signed & 0x1ff
+ (int)B->object_id
|
- ((int)B->type_flags_signed >> 0) & 0x1ffU
+ (uint)B->object_id
|
- ((int)B->type_flags_signed & 0x1ffU) >> 0
+ (uint)B->object_id
|
- (int)B->type_flags_signed & 0x1ffU
+ (uint)B->object_id
|
- ((uint)B->type_flags_signed >> 0) & 0x1ff
+ (uint)B->object_id
|
- ((uint)B->type_flags_signed & 0x1ff) >> 0
+ (uint)B->object_id
|
- (uint)B->type_flags_signed & 0x1ff
+ (uint)B->object_id
|
- ((uint)B->type_flags_signed >> 0) & 0x1ffU
+ (uint)B->object_id
|
- ((uint)B->type_flags_signed & 0x1ffU) >> 0
+ (uint)B->object_id
|
- (uint)B->type_flags_signed & 0x1ffU
+ (uint)B->object_id
)

@promoted_type_flags_flags_res_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->type_flags >> 9) & 0x7
+ (int)B->flags_res
|
- ((int)B->type_flags & 0xe00) >> 9
+ (int)B->flags_res
|
- (int)B->type_flags & 0xe00
+ ((int)B->flags_res << 9)
|
- ((int)B->type_flags >> 9) & 0x7U
+ (uint)B->flags_res
|
- ((int)B->type_flags & 0xe00U) >> 9
+ (uint)B->flags_res
|
- (int)B->type_flags & 0xe00U
+ ((uint)B->flags_res << 9)
|
- ((uint)B->type_flags >> 9) & 0x7
+ (uint)B->flags_res
|
- ((uint)B->type_flags & 0xe00) >> 9
+ (uint)B->flags_res
|
- (uint)B->type_flags & 0xe00
+ ((uint)B->flags_res << 9)
|
- ((uint)B->type_flags >> 9) & 0x7U
+ (uint)B->flags_res
|
- ((uint)B->type_flags & 0xe00U) >> 9
+ (uint)B->flags_res
|
- (uint)B->type_flags & 0xe00U
+ ((uint)B->flags_res << 9)
|
- ((int)B->type_flags_signed >> 9) & 0x7
+ (int)B->flags_res
|
- ((int)B->type_flags_signed & 0xe00) >> 9
+ (int)B->flags_res
|
- (int)B->type_flags_signed & 0xe00
+ ((int)B->flags_res << 9)
|
- ((int)B->type_flags_signed >> 9) & 0x7U
+ (uint)B->flags_res
|
- ((int)B->type_flags_signed & 0xe00U) >> 9
+ (uint)B->flags_res
|
- (int)B->type_flags_signed & 0xe00U
+ ((uint)B->flags_res << 9)
|
- ((uint)B->type_flags_signed >> 9) & 0x7
+ (uint)B->flags_res
|
- ((uint)B->type_flags_signed & 0xe00) >> 9
+ (uint)B->flags_res
|
- (uint)B->type_flags_signed & 0xe00
+ ((uint)B->flags_res << 9)
|
- ((uint)B->type_flags_signed >> 9) & 0x7U
+ (uint)B->flags_res
|
- ((uint)B->type_flags_signed & 0xe00U) >> 9
+ (uint)B->flags_res
|
- (uint)B->type_flags_signed & 0xe00U
+ ((uint)B->flags_res << 9)
)

@promoted_type_flags_enchanted_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->type_flags >> 12) & 0x1
+ (int)B->enchanted
|
- ((int)B->type_flags & 0x1000) >> 12
+ (int)B->enchanted
|
- (int)B->type_flags & 0x1000
+ ((int)B->enchanted << 12)
|
- ((int)B->type_flags >> 12) & 0x1U
+ (uint)B->enchanted
|
- ((int)B->type_flags & 0x1000U) >> 12
+ (uint)B->enchanted
|
- (int)B->type_flags & 0x1000U
+ ((uint)B->enchanted << 12)
|
- ((uint)B->type_flags >> 12) & 0x1
+ (uint)B->enchanted
|
- ((uint)B->type_flags & 0x1000) >> 12
+ (uint)B->enchanted
|
- (uint)B->type_flags & 0x1000
+ ((uint)B->enchanted << 12)
|
- ((uint)B->type_flags >> 12) & 0x1U
+ (uint)B->enchanted
|
- ((uint)B->type_flags & 0x1000U) >> 12
+ (uint)B->enchanted
|
- (uint)B->type_flags & 0x1000U
+ ((uint)B->enchanted << 12)
|
- ((int)B->type_flags_signed >> 12) & 0x1
+ (int)B->enchanted
|
- ((int)B->type_flags_signed & 0x1000) >> 12
+ (int)B->enchanted
|
- (int)B->type_flags_signed & 0x1000
+ ((int)B->enchanted << 12)
|
- ((int)B->type_flags_signed >> 12) & 0x1U
+ (uint)B->enchanted
|
- ((int)B->type_flags_signed & 0x1000U) >> 12
+ (uint)B->enchanted
|
- (int)B->type_flags_signed & 0x1000U
+ ((uint)B->enchanted << 12)
|
- ((uint)B->type_flags_signed >> 12) & 0x1
+ (uint)B->enchanted
|
- ((uint)B->type_flags_signed & 0x1000) >> 12
+ (uint)B->enchanted
|
- (uint)B->type_flags_signed & 0x1000
+ ((uint)B->enchanted << 12)
|
- ((uint)B->type_flags_signed >> 12) & 0x1U
+ (uint)B->enchanted
|
- ((uint)B->type_flags_signed & 0x1000U) >> 12
+ (uint)B->enchanted
|
- (uint)B->type_flags_signed & 0x1000U
+ ((uint)B->enchanted << 12)
)

@promoted_type_flags_doordir_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->type_flags >> 13) & 0x1
+ (int)B->doordir
|
- ((int)B->type_flags & 0x2000) >> 13
+ (int)B->doordir
|
- (int)B->type_flags & 0x2000
+ ((int)B->doordir << 13)
|
- ((int)B->type_flags >> 13) & 0x1U
+ (uint)B->doordir
|
- ((int)B->type_flags & 0x2000U) >> 13
+ (uint)B->doordir
|
- (int)B->type_flags & 0x2000U
+ ((uint)B->doordir << 13)
|
- ((uint)B->type_flags >> 13) & 0x1
+ (uint)B->doordir
|
- ((uint)B->type_flags & 0x2000) >> 13
+ (uint)B->doordir
|
- (uint)B->type_flags & 0x2000
+ ((uint)B->doordir << 13)
|
- ((uint)B->type_flags >> 13) & 0x1U
+ (uint)B->doordir
|
- ((uint)B->type_flags & 0x2000U) >> 13
+ (uint)B->doordir
|
- (uint)B->type_flags & 0x2000U
+ ((uint)B->doordir << 13)
|
- ((int)B->type_flags_signed >> 13) & 0x1
+ (int)B->doordir
|
- ((int)B->type_flags_signed & 0x2000) >> 13
+ (int)B->doordir
|
- (int)B->type_flags_signed & 0x2000
+ ((int)B->doordir << 13)
|
- ((int)B->type_flags_signed >> 13) & 0x1U
+ (uint)B->doordir
|
- ((int)B->type_flags_signed & 0x2000U) >> 13
+ (uint)B->doordir
|
- (int)B->type_flags_signed & 0x2000U
+ ((uint)B->doordir << 13)
|
- ((uint)B->type_flags_signed >> 13) & 0x1
+ (uint)B->doordir
|
- ((uint)B->type_flags_signed & 0x2000) >> 13
+ (uint)B->doordir
|
- (uint)B->type_flags_signed & 0x2000
+ ((uint)B->doordir << 13)
|
- ((uint)B->type_flags_signed >> 13) & 0x1U
+ (uint)B->doordir
|
- ((uint)B->type_flags_signed & 0x2000U) >> 13
+ (uint)B->doordir
|
- (uint)B->type_flags_signed & 0x2000U
+ ((uint)B->doordir << 13)
)

@promoted_type_flags_invisible_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->type_flags >> 14) & 0x1
+ (int)B->invisible
|
- ((int)B->type_flags & 0x4000) >> 14
+ (int)B->invisible
|
- (int)B->type_flags & 0x4000
+ ((int)B->invisible << 14)
|
- ((int)B->type_flags >> 14) & 0x1U
+ (uint)B->invisible
|
- ((int)B->type_flags & 0x4000U) >> 14
+ (uint)B->invisible
|
- (int)B->type_flags & 0x4000U
+ ((uint)B->invisible << 14)
|
- ((uint)B->type_flags >> 14) & 0x1
+ (uint)B->invisible
|
- ((uint)B->type_flags & 0x4000) >> 14
+ (uint)B->invisible
|
- (uint)B->type_flags & 0x4000
+ ((uint)B->invisible << 14)
|
- ((uint)B->type_flags >> 14) & 0x1U
+ (uint)B->invisible
|
- ((uint)B->type_flags & 0x4000U) >> 14
+ (uint)B->invisible
|
- (uint)B->type_flags & 0x4000U
+ ((uint)B->invisible << 14)
|
- ((int)B->type_flags_signed >> 14) & 0x1
+ (int)B->invisible
|
- ((int)B->type_flags_signed & 0x4000) >> 14
+ (int)B->invisible
|
- (int)B->type_flags_signed & 0x4000
+ ((int)B->invisible << 14)
|
- ((int)B->type_flags_signed >> 14) & 0x1U
+ (uint)B->invisible
|
- ((int)B->type_flags_signed & 0x4000U) >> 14
+ (uint)B->invisible
|
- (int)B->type_flags_signed & 0x4000U
+ ((uint)B->invisible << 14)
|
- ((uint)B->type_flags_signed >> 14) & 0x1
+ (uint)B->invisible
|
- ((uint)B->type_flags_signed & 0x4000) >> 14
+ (uint)B->invisible
|
- (uint)B->type_flags_signed & 0x4000
+ ((uint)B->invisible << 14)
|
- ((uint)B->type_flags_signed >> 14) & 0x1U
+ (uint)B->invisible
|
- ((uint)B->type_flags_signed & 0x4000U) >> 14
+ (uint)B->invisible
|
- (uint)B->type_flags_signed & 0x4000U
+ ((uint)B->invisible << 14)
)

@promoted_type_flags_is_quant_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->type_flags >> 15) & 0x1
+ (int)B->is_quant
|
- ((int)B->type_flags & 0x8000) >> 15
+ (int)B->is_quant
|
- (int)B->type_flags & 0x8000
+ ((int)B->is_quant << 15)
|
- ((int)B->type_flags >> 15) & 0x1U
+ (uint)B->is_quant
|
- ((int)B->type_flags & 0x8000U) >> 15
+ (uint)B->is_quant
|
- (int)B->type_flags & 0x8000U
+ ((uint)B->is_quant << 15)
|
- ((uint)B->type_flags >> 15) & 0x1
+ (uint)B->is_quant
|
- ((uint)B->type_flags & 0x8000) >> 15
+ (uint)B->is_quant
|
- (uint)B->type_flags & 0x8000
+ ((uint)B->is_quant << 15)
|
- ((uint)B->type_flags >> 15) & 0x1U
+ (uint)B->is_quant
|
- ((uint)B->type_flags & 0x8000U) >> 15
+ (uint)B->is_quant
|
- (uint)B->type_flags & 0x8000U
+ ((uint)B->is_quant << 15)
|
- ((int)B->type_flags_signed >> 15) & 0x1
+ (int)B->is_quant
|
- ((int)B->type_flags_signed & 0x8000) >> 15
+ (int)B->is_quant
|
- (int)B->type_flags_signed & 0x8000
+ ((int)B->is_quant << 15)
|
- ((int)B->type_flags_signed >> 15) & 0x1U
+ (uint)B->is_quant
|
- ((int)B->type_flags_signed & 0x8000U) >> 15
+ (uint)B->is_quant
|
- (int)B->type_flags_signed & 0x8000U
+ ((uint)B->is_quant << 15)
|
- ((uint)B->type_flags_signed >> 15) & 0x1
+ (uint)B->is_quant
|
- ((uint)B->type_flags_signed & 0x8000) >> 15
+ (uint)B->is_quant
|
- (uint)B->type_flags_signed & 0x8000
+ ((uint)B->is_quant << 15)
|
- ((uint)B->type_flags_signed >> 15) & 0x1U
+ (uint)B->is_quant
|
- ((uint)B->type_flags_signed & 0x8000U) >> 15
+ (uint)B->is_quant
|
- (uint)B->type_flags_signed & 0x8000U
+ ((uint)B->is_quant << 15)
)

@promoted_position_word_zpos_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->position_word >> 0) & 0x7f
+ (int)B->zpos
|
- ((int)B->position_word & 0x7f) >> 0
+ (int)B->zpos
|
- (int)B->position_word & 0x7f
+ (int)B->zpos
|
- ((int)B->position_word >> 0) & 0x7fU
+ (uint)B->zpos
|
- ((int)B->position_word & 0x7fU) >> 0
+ (uint)B->zpos
|
- (int)B->position_word & 0x7fU
+ (uint)B->zpos
|
- ((uint)B->position_word >> 0) & 0x7f
+ (uint)B->zpos
|
- ((uint)B->position_word & 0x7f) >> 0
+ (uint)B->zpos
|
- (uint)B->position_word & 0x7f
+ (uint)B->zpos
|
- ((uint)B->position_word >> 0) & 0x7fU
+ (uint)B->zpos
|
- ((uint)B->position_word & 0x7fU) >> 0
+ (uint)B->zpos
|
- (uint)B->position_word & 0x7fU
+ (uint)B->zpos
|
- ((int)B->position_word_signed >> 0) & 0x7f
+ (int)B->zpos
|
- ((int)B->position_word_signed & 0x7f) >> 0
+ (int)B->zpos
|
- (int)B->position_word_signed & 0x7f
+ (int)B->zpos
|
- ((int)B->position_word_signed >> 0) & 0x7fU
+ (uint)B->zpos
|
- ((int)B->position_word_signed & 0x7fU) >> 0
+ (uint)B->zpos
|
- (int)B->position_word_signed & 0x7fU
+ (uint)B->zpos
|
- ((uint)B->position_word_signed >> 0) & 0x7f
+ (uint)B->zpos
|
- ((uint)B->position_word_signed & 0x7f) >> 0
+ (uint)B->zpos
|
- (uint)B->position_word_signed & 0x7f
+ (uint)B->zpos
|
- ((uint)B->position_word_signed >> 0) & 0x7fU
+ (uint)B->zpos
|
- ((uint)B->position_word_signed & 0x7fU) >> 0
+ (uint)B->zpos
|
- (uint)B->position_word_signed & 0x7fU
+ (uint)B->zpos
)

@promoted_position_word_heading_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->position_word >> 7) & 0x7
+ (int)B->heading
|
- ((int)B->position_word & 0x380) >> 7
+ (int)B->heading
|
- (int)B->position_word & 0x380
+ ((int)B->heading << 7)
|
- ((int)B->position_word >> 7) & 0x7U
+ (uint)B->heading
|
- ((int)B->position_word & 0x380U) >> 7
+ (uint)B->heading
|
- (int)B->position_word & 0x380U
+ ((uint)B->heading << 7)
|
- ((uint)B->position_word >> 7) & 0x7
+ (uint)B->heading
|
- ((uint)B->position_word & 0x380) >> 7
+ (uint)B->heading
|
- (uint)B->position_word & 0x380
+ ((uint)B->heading << 7)
|
- ((uint)B->position_word >> 7) & 0x7U
+ (uint)B->heading
|
- ((uint)B->position_word & 0x380U) >> 7
+ (uint)B->heading
|
- (uint)B->position_word & 0x380U
+ ((uint)B->heading << 7)
|
- ((int)B->position_word_signed >> 7) & 0x7
+ (int)B->heading
|
- ((int)B->position_word_signed & 0x380) >> 7
+ (int)B->heading
|
- (int)B->position_word_signed & 0x380
+ ((int)B->heading << 7)
|
- ((int)B->position_word_signed >> 7) & 0x7U
+ (uint)B->heading
|
- ((int)B->position_word_signed & 0x380U) >> 7
+ (uint)B->heading
|
- (int)B->position_word_signed & 0x380U
+ ((uint)B->heading << 7)
|
- ((uint)B->position_word_signed >> 7) & 0x7
+ (uint)B->heading
|
- ((uint)B->position_word_signed & 0x380) >> 7
+ (uint)B->heading
|
- (uint)B->position_word_signed & 0x380
+ ((uint)B->heading << 7)
|
- ((uint)B->position_word_signed >> 7) & 0x7U
+ (uint)B->heading
|
- ((uint)B->position_word_signed & 0x380U) >> 7
+ (uint)B->heading
|
- (uint)B->position_word_signed & 0x380U
+ ((uint)B->heading << 7)
)

@promoted_position_word_ypos_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->position_word >> 10) & 0x7
+ (int)B->ypos
|
- ((int)B->position_word & 0x1c00) >> 10
+ (int)B->ypos
|
- (int)B->position_word & 0x1c00
+ ((int)B->ypos << 10)
|
- ((int)B->position_word >> 10) & 0x7U
+ (uint)B->ypos
|
- ((int)B->position_word & 0x1c00U) >> 10
+ (uint)B->ypos
|
- (int)B->position_word & 0x1c00U
+ ((uint)B->ypos << 10)
|
- ((uint)B->position_word >> 10) & 0x7
+ (uint)B->ypos
|
- ((uint)B->position_word & 0x1c00) >> 10
+ (uint)B->ypos
|
- (uint)B->position_word & 0x1c00
+ ((uint)B->ypos << 10)
|
- ((uint)B->position_word >> 10) & 0x7U
+ (uint)B->ypos
|
- ((uint)B->position_word & 0x1c00U) >> 10
+ (uint)B->ypos
|
- (uint)B->position_word & 0x1c00U
+ ((uint)B->ypos << 10)
|
- ((int)B->position_word_signed >> 10) & 0x7
+ (int)B->ypos
|
- ((int)B->position_word_signed & 0x1c00) >> 10
+ (int)B->ypos
|
- (int)B->position_word_signed & 0x1c00
+ ((int)B->ypos << 10)
|
- ((int)B->position_word_signed >> 10) & 0x7U
+ (uint)B->ypos
|
- ((int)B->position_word_signed & 0x1c00U) >> 10
+ (uint)B->ypos
|
- (int)B->position_word_signed & 0x1c00U
+ ((uint)B->ypos << 10)
|
- ((uint)B->position_word_signed >> 10) & 0x7
+ (uint)B->ypos
|
- ((uint)B->position_word_signed & 0x1c00) >> 10
+ (uint)B->ypos
|
- (uint)B->position_word_signed & 0x1c00
+ ((uint)B->ypos << 10)
|
- ((uint)B->position_word_signed >> 10) & 0x7U
+ (uint)B->ypos
|
- ((uint)B->position_word_signed & 0x1c00U) >> 10
+ (uint)B->ypos
|
- (uint)B->position_word_signed & 0x1c00U
+ ((uint)B->ypos << 10)
)

@promoted_position_word_xpos_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->position_word >> 13) & 0x7
+ (int)B->xpos
|
- ((int)B->position_word & 0xe000) >> 13
+ (int)B->xpos
|
- (int)B->position_word & 0xe000
+ ((int)B->xpos << 13)
|
- ((int)B->position_word >> 13) & 0x7U
+ (uint)B->xpos
|
- ((int)B->position_word & 0xe000U) >> 13
+ (uint)B->xpos
|
- (int)B->position_word & 0xe000U
+ ((uint)B->xpos << 13)
|
- ((uint)B->position_word >> 13) & 0x7
+ (uint)B->xpos
|
- ((uint)B->position_word & 0xe000) >> 13
+ (uint)B->xpos
|
- (uint)B->position_word & 0xe000
+ ((uint)B->xpos << 13)
|
- ((uint)B->position_word >> 13) & 0x7U
+ (uint)B->xpos
|
- ((uint)B->position_word & 0xe000U) >> 13
+ (uint)B->xpos
|
- (uint)B->position_word & 0xe000U
+ ((uint)B->xpos << 13)
|
- ((int)B->position_word_signed >> 13) & 0x7
+ (int)B->xpos
|
- ((int)B->position_word_signed & 0xe000) >> 13
+ (int)B->xpos
|
- (int)B->position_word_signed & 0xe000
+ ((int)B->xpos << 13)
|
- ((int)B->position_word_signed >> 13) & 0x7U
+ (uint)B->xpos
|
- ((int)B->position_word_signed & 0xe000U) >> 13
+ (uint)B->xpos
|
- (int)B->position_word_signed & 0xe000U
+ ((uint)B->xpos << 13)
|
- ((uint)B->position_word_signed >> 13) & 0x7
+ (uint)B->xpos
|
- ((uint)B->position_word_signed & 0xe000) >> 13
+ (uint)B->xpos
|
- (uint)B->position_word_signed & 0xe000
+ ((uint)B->xpos << 13)
|
- ((uint)B->position_word_signed >> 13) & 0x7U
+ (uint)B->xpos
|
- ((uint)B->position_word_signed & 0xe000U) >> 13
+ (uint)B->xpos
|
- (uint)B->position_word_signed & 0xe000U
+ ((uint)B->xpos << 13)
)

@promoted_chain_word_quality_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->chain_word >> 0) & 0x3f
+ (int)B->quality
|
- ((int)B->chain_word & 0x3f) >> 0
+ (int)B->quality
|
- (int)B->chain_word & 0x3f
+ (int)B->quality
|
- ((int)B->chain_word >> 0) & 0x3fU
+ (uint)B->quality
|
- ((int)B->chain_word & 0x3fU) >> 0
+ (uint)B->quality
|
- (int)B->chain_word & 0x3fU
+ (uint)B->quality
|
- ((uint)B->chain_word >> 0) & 0x3f
+ (uint)B->quality
|
- ((uint)B->chain_word & 0x3f) >> 0
+ (uint)B->quality
|
- (uint)B->chain_word & 0x3f
+ (uint)B->quality
|
- ((uint)B->chain_word >> 0) & 0x3fU
+ (uint)B->quality
|
- ((uint)B->chain_word & 0x3fU) >> 0
+ (uint)B->quality
|
- (uint)B->chain_word & 0x3fU
+ (uint)B->quality
|
- ((int)B->chain_word_signed >> 0) & 0x3f
+ (int)B->quality
|
- ((int)B->chain_word_signed & 0x3f) >> 0
+ (int)B->quality
|
- (int)B->chain_word_signed & 0x3f
+ (int)B->quality
|
- ((int)B->chain_word_signed >> 0) & 0x3fU
+ (uint)B->quality
|
- ((int)B->chain_word_signed & 0x3fU) >> 0
+ (uint)B->quality
|
- (int)B->chain_word_signed & 0x3fU
+ (uint)B->quality
|
- ((uint)B->chain_word_signed >> 0) & 0x3f
+ (uint)B->quality
|
- ((uint)B->chain_word_signed & 0x3f) >> 0
+ (uint)B->quality
|
- (uint)B->chain_word_signed & 0x3f
+ (uint)B->quality
|
- ((uint)B->chain_word_signed >> 0) & 0x3fU
+ (uint)B->quality
|
- ((uint)B->chain_word_signed & 0x3fU) >> 0
+ (uint)B->quality
|
- (uint)B->chain_word_signed & 0x3fU
+ (uint)B->quality
)

@promoted_chain_word_next_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->chain_word >> 6) & 0x3ff
+ (int)B->next
|
- ((int)B->chain_word & 0xffc0) >> 6
+ (int)B->next
|
- (int)B->chain_word & 0xffc0
+ ((int)B->next << 6)
|
- ((int)B->chain_word >> 6) & 0x3ffU
+ (uint)B->next
|
- ((int)B->chain_word & 0xffc0U) >> 6
+ (uint)B->next
|
- (int)B->chain_word & 0xffc0U
+ ((uint)B->next << 6)
|
- ((uint)B->chain_word >> 6) & 0x3ff
+ (uint)B->next
|
- ((uint)B->chain_word & 0xffc0) >> 6
+ (uint)B->next
|
- (uint)B->chain_word & 0xffc0
+ ((uint)B->next << 6)
|
- ((uint)B->chain_word >> 6) & 0x3ffU
+ (uint)B->next
|
- ((uint)B->chain_word & 0xffc0U) >> 6
+ (uint)B->next
|
- (uint)B->chain_word & 0xffc0U
+ ((uint)B->next << 6)
|
- ((int)B->chain_word_signed >> 6) & 0x3ff
+ (int)B->next
|
- ((int)B->chain_word_signed & 0xffc0) >> 6
+ (int)B->next
|
- (int)B->chain_word_signed & 0xffc0
+ ((int)B->next << 6)
|
- ((int)B->chain_word_signed >> 6) & 0x3ffU
+ (uint)B->next
|
- ((int)B->chain_word_signed & 0xffc0U) >> 6
+ (uint)B->next
|
- (int)B->chain_word_signed & 0xffc0U
+ ((uint)B->next << 6)
|
- ((uint)B->chain_word_signed >> 6) & 0x3ff
+ (uint)B->next
|
- ((uint)B->chain_word_signed & 0xffc0) >> 6
+ (uint)B->next
|
- (uint)B->chain_word_signed & 0xffc0
+ ((uint)B->next << 6)
|
- ((uint)B->chain_word_signed >> 6) & 0x3ffU
+ (uint)B->next
|
- ((uint)B->chain_word_signed & 0xffc0U) >> 6
+ (uint)B->next
|
- (uint)B->chain_word_signed & 0xffc0U
+ ((uint)B->next << 6)
)

@promoted_link_word_owner_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->link_word >> 0) & 0x3f
+ (int)B->owner
|
- ((int)B->link_word & 0x3f) >> 0
+ (int)B->owner
|
- (int)B->link_word & 0x3f
+ (int)B->owner
|
- ((int)B->link_word >> 0) & 0x3fU
+ (uint)B->owner
|
- ((int)B->link_word & 0x3fU) >> 0
+ (uint)B->owner
|
- (int)B->link_word & 0x3fU
+ (uint)B->owner
|
- ((uint)B->link_word >> 0) & 0x3f
+ (uint)B->owner
|
- ((uint)B->link_word & 0x3f) >> 0
+ (uint)B->owner
|
- (uint)B->link_word & 0x3f
+ (uint)B->owner
|
- ((uint)B->link_word >> 0) & 0x3fU
+ (uint)B->owner
|
- ((uint)B->link_word & 0x3fU) >> 0
+ (uint)B->owner
|
- (uint)B->link_word & 0x3fU
+ (uint)B->owner
|
- ((int)B->link_word_signed >> 0) & 0x3f
+ (int)B->owner
|
- ((int)B->link_word_signed & 0x3f) >> 0
+ (int)B->owner
|
- (int)B->link_word_signed & 0x3f
+ (int)B->owner
|
- ((int)B->link_word_signed >> 0) & 0x3fU
+ (uint)B->owner
|
- ((int)B->link_word_signed & 0x3fU) >> 0
+ (uint)B->owner
|
- (int)B->link_word_signed & 0x3fU
+ (uint)B->owner
|
- ((uint)B->link_word_signed >> 0) & 0x3f
+ (uint)B->owner
|
- ((uint)B->link_word_signed & 0x3f) >> 0
+ (uint)B->owner
|
- (uint)B->link_word_signed & 0x3f
+ (uint)B->owner
|
- ((uint)B->link_word_signed >> 0) & 0x3fU
+ (uint)B->owner
|
- ((uint)B->link_word_signed & 0x3fU) >> 0
+ (uint)B->owner
|
- (uint)B->link_word_signed & 0x3fU
+ (uint)B->owner
)

@promoted_link_word_link_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->link_word >> 6) & 0x3ff
+ (int)B->link
|
- ((int)B->link_word & 0xffc0) >> 6
+ (int)B->link
|
- (int)B->link_word & 0xffc0
+ ((int)B->link << 6)
|
- ((int)B->link_word >> 6) & 0x3ffU
+ (uint)B->link
|
- ((int)B->link_word & 0xffc0U) >> 6
+ (uint)B->link
|
- (int)B->link_word & 0xffc0U
+ ((uint)B->link << 6)
|
- ((uint)B->link_word >> 6) & 0x3ff
+ (uint)B->link
|
- ((uint)B->link_word & 0xffc0) >> 6
+ (uint)B->link
|
- (uint)B->link_word & 0xffc0
+ ((uint)B->link << 6)
|
- ((uint)B->link_word >> 6) & 0x3ffU
+ (uint)B->link
|
- ((uint)B->link_word & 0xffc0U) >> 6
+ (uint)B->link
|
- (uint)B->link_word & 0xffc0U
+ ((uint)B->link << 6)
|
- ((int)B->link_word_signed >> 6) & 0x3ff
+ (int)B->link
|
- ((int)B->link_word_signed & 0xffc0) >> 6
+ (int)B->link
|
- (int)B->link_word_signed & 0xffc0
+ ((int)B->link << 6)
|
- ((int)B->link_word_signed >> 6) & 0x3ffU
+ (uint)B->link
|
- ((int)B->link_word_signed & 0xffc0U) >> 6
+ (uint)B->link
|
- (int)B->link_word_signed & 0xffc0U
+ ((uint)B->link << 6)
|
- ((uint)B->link_word_signed >> 6) & 0x3ff
+ (uint)B->link
|
- ((uint)B->link_word_signed & 0xffc0) >> 6
+ (uint)B->link
|
- (uint)B->link_word_signed & 0xffc0
+ ((uint)B->link << 6)
|
- ((uint)B->link_word_signed >> 6) & 0x3ffU
+ (uint)B->link
|
- ((uint)B->link_word_signed & 0xffc0U) >> 6
+ (uint)B->link
|
- (uint)B->link_word_signed & 0xffc0U
+ ((uint)B->link << 6)
)

@promoted_goal_word_npc_goal_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->goal_word >> 0) & 0xf
+ (int)B->npc_goal
|
- ((int)B->goal_word & 0xf) >> 0
+ (int)B->npc_goal
|
- (int)B->goal_word & 0xf
+ (int)B->npc_goal
|
- ((int)B->goal_word >> 0) & 0xfU
+ (uint)B->npc_goal
|
- ((int)B->goal_word & 0xfU) >> 0
+ (uint)B->npc_goal
|
- (int)B->goal_word & 0xfU
+ (uint)B->npc_goal
|
- ((uint)B->goal_word >> 0) & 0xf
+ (uint)B->npc_goal
|
- ((uint)B->goal_word & 0xf) >> 0
+ (uint)B->npc_goal
|
- (uint)B->goal_word & 0xf
+ (uint)B->npc_goal
|
- ((uint)B->goal_word >> 0) & 0xfU
+ (uint)B->npc_goal
|
- ((uint)B->goal_word & 0xfU) >> 0
+ (uint)B->npc_goal
|
- (uint)B->goal_word & 0xfU
+ (uint)B->npc_goal
|
- ((int)B->goal_word_signed >> 0) & 0xf
+ (int)B->npc_goal
|
- ((int)B->goal_word_signed & 0xf) >> 0
+ (int)B->npc_goal
|
- (int)B->goal_word_signed & 0xf
+ (int)B->npc_goal
|
- ((int)B->goal_word_signed >> 0) & 0xfU
+ (uint)B->npc_goal
|
- ((int)B->goal_word_signed & 0xfU) >> 0
+ (uint)B->npc_goal
|
- (int)B->goal_word_signed & 0xfU
+ (uint)B->npc_goal
|
- ((uint)B->goal_word_signed >> 0) & 0xf
+ (uint)B->npc_goal
|
- ((uint)B->goal_word_signed & 0xf) >> 0
+ (uint)B->npc_goal
|
- (uint)B->goal_word_signed & 0xf
+ (uint)B->npc_goal
|
- ((uint)B->goal_word_signed >> 0) & 0xfU
+ (uint)B->npc_goal
|
- ((uint)B->goal_word_signed & 0xfU) >> 0
+ (uint)B->npc_goal
|
- (uint)B->goal_word_signed & 0xfU
+ (uint)B->npc_goal
)

@promoted_goal_word_npc_gtarg_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->goal_word >> 4) & 0xff
+ (int)B->npc_gtarg
|
- ((int)B->goal_word & 0xff0) >> 4
+ (int)B->npc_gtarg
|
- (int)B->goal_word & 0xff0
+ ((int)B->npc_gtarg << 4)
|
- ((int)B->goal_word >> 4) & 0xffU
+ (uint)B->npc_gtarg
|
- ((int)B->goal_word & 0xff0U) >> 4
+ (uint)B->npc_gtarg
|
- (int)B->goal_word & 0xff0U
+ ((uint)B->npc_gtarg << 4)
|
- ((uint)B->goal_word >> 4) & 0xff
+ (uint)B->npc_gtarg
|
- ((uint)B->goal_word & 0xff0) >> 4
+ (uint)B->npc_gtarg
|
- (uint)B->goal_word & 0xff0
+ ((uint)B->npc_gtarg << 4)
|
- ((uint)B->goal_word >> 4) & 0xffU
+ (uint)B->npc_gtarg
|
- ((uint)B->goal_word & 0xff0U) >> 4
+ (uint)B->npc_gtarg
|
- (uint)B->goal_word & 0xff0U
+ ((uint)B->npc_gtarg << 4)
|
- ((int)B->goal_word_signed >> 4) & 0xff
+ (int)B->npc_gtarg
|
- ((int)B->goal_word_signed & 0xff0) >> 4
+ (int)B->npc_gtarg
|
- (int)B->goal_word_signed & 0xff0
+ ((int)B->npc_gtarg << 4)
|
- ((int)B->goal_word_signed >> 4) & 0xffU
+ (uint)B->npc_gtarg
|
- ((int)B->goal_word_signed & 0xff0U) >> 4
+ (uint)B->npc_gtarg
|
- (int)B->goal_word_signed & 0xff0U
+ ((uint)B->npc_gtarg << 4)
|
- ((uint)B->goal_word_signed >> 4) & 0xff
+ (uint)B->npc_gtarg
|
- ((uint)B->goal_word_signed & 0xff0) >> 4
+ (uint)B->npc_gtarg
|
- (uint)B->goal_word_signed & 0xff0
+ ((uint)B->npc_gtarg << 4)
|
- ((uint)B->goal_word_signed >> 4) & 0xffU
+ (uint)B->npc_gtarg
|
- ((uint)B->goal_word_signed & 0xff0U) >> 4
+ (uint)B->npc_gtarg
|
- (uint)B->goal_word_signed & 0xff0U
+ ((uint)B->npc_gtarg << 4)
)

@promoted_goal_word_npc_animation_frame_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->goal_word >> 12) & 0xf
+ (int)B->npc_animation_frame
|
- ((int)B->goal_word & 0xf000) >> 12
+ (int)B->npc_animation_frame
|
- (int)B->goal_word & 0xf000
+ ((int)B->npc_animation_frame << 12)
|
- ((int)B->goal_word >> 12) & 0xfU
+ (uint)B->npc_animation_frame
|
- ((int)B->goal_word & 0xf000U) >> 12
+ (uint)B->npc_animation_frame
|
- (int)B->goal_word & 0xf000U
+ ((uint)B->npc_animation_frame << 12)
|
- ((uint)B->goal_word >> 12) & 0xf
+ (uint)B->npc_animation_frame
|
- ((uint)B->goal_word & 0xf000) >> 12
+ (uint)B->npc_animation_frame
|
- (uint)B->goal_word & 0xf000
+ ((uint)B->npc_animation_frame << 12)
|
- ((uint)B->goal_word >> 12) & 0xfU
+ (uint)B->npc_animation_frame
|
- ((uint)B->goal_word & 0xf000U) >> 12
+ (uint)B->npc_animation_frame
|
- (uint)B->goal_word & 0xf000U
+ ((uint)B->npc_animation_frame << 12)
|
- ((int)B->goal_word_signed >> 12) & 0xf
+ (int)B->npc_animation_frame
|
- ((int)B->goal_word_signed & 0xf000) >> 12
+ (int)B->npc_animation_frame
|
- (int)B->goal_word_signed & 0xf000
+ ((int)B->npc_animation_frame << 12)
|
- ((int)B->goal_word_signed >> 12) & 0xfU
+ (uint)B->npc_animation_frame
|
- ((int)B->goal_word_signed & 0xf000U) >> 12
+ (uint)B->npc_animation_frame
|
- (int)B->goal_word_signed & 0xf000U
+ ((uint)B->npc_animation_frame << 12)
|
- ((uint)B->goal_word_signed >> 12) & 0xf
+ (uint)B->npc_animation_frame
|
- ((uint)B->goal_word_signed & 0xf000) >> 12
+ (uint)B->npc_animation_frame
|
- (uint)B->goal_word_signed & 0xf000
+ ((uint)B->npc_animation_frame << 12)
|
- ((uint)B->goal_word_signed >> 12) & 0xfU
+ (uint)B->npc_animation_frame
|
- ((uint)B->goal_word_signed & 0xf000U) >> 12
+ (uint)B->npc_animation_frame
|
- (uint)B->goal_word_signed & 0xf000U
+ ((uint)B->npc_animation_frame << 12)
)

@promoted_status_word_npc_level_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->status_word >> 0) & 0xf
+ (int)B->npc_level
|
- ((int)B->status_word & 0xf) >> 0
+ (int)B->npc_level
|
- (int)B->status_word & 0xf
+ (int)B->npc_level
|
- ((int)B->status_word >> 0) & 0xfU
+ (uint)B->npc_level
|
- ((int)B->status_word & 0xfU) >> 0
+ (uint)B->npc_level
|
- (int)B->status_word & 0xfU
+ (uint)B->npc_level
|
- ((uint)B->status_word >> 0) & 0xf
+ (uint)B->npc_level
|
- ((uint)B->status_word & 0xf) >> 0
+ (uint)B->npc_level
|
- (uint)B->status_word & 0xf
+ (uint)B->npc_level
|
- ((uint)B->status_word >> 0) & 0xfU
+ (uint)B->npc_level
|
- ((uint)B->status_word & 0xfU) >> 0
+ (uint)B->npc_level
|
- (uint)B->status_word & 0xfU
+ (uint)B->npc_level
|
- ((int)B->status_word_signed >> 0) & 0xf
+ (int)B->npc_level
|
- ((int)B->status_word_signed & 0xf) >> 0
+ (int)B->npc_level
|
- (int)B->status_word_signed & 0xf
+ (int)B->npc_level
|
- ((int)B->status_word_signed >> 0) & 0xfU
+ (uint)B->npc_level
|
- ((int)B->status_word_signed & 0xfU) >> 0
+ (uint)B->npc_level
|
- (int)B->status_word_signed & 0xfU
+ (uint)B->npc_level
|
- ((uint)B->status_word_signed >> 0) & 0xf
+ (uint)B->npc_level
|
- ((uint)B->status_word_signed & 0xf) >> 0
+ (uint)B->npc_level
|
- (uint)B->status_word_signed & 0xf
+ (uint)B->npc_level
|
- ((uint)B->status_word_signed >> 0) & 0xfU
+ (uint)B->npc_level
|
- ((uint)B->status_word_signed & 0xfU) >> 0
+ (uint)B->npc_level
|
- (uint)B->status_word_signed & 0xfU
+ (uint)B->npc_level
)

@promoted_status_word_npc_talkedto_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->status_word >> 13) & 0x1
+ (int)B->npc_talkedto
|
- ((int)B->status_word & 0x2000) >> 13
+ (int)B->npc_talkedto
|
- (int)B->status_word & 0x2000
+ ((int)B->npc_talkedto << 13)
|
- ((int)B->status_word >> 13) & 0x1U
+ (uint)B->npc_talkedto
|
- ((int)B->status_word & 0x2000U) >> 13
+ (uint)B->npc_talkedto
|
- (int)B->status_word & 0x2000U
+ ((uint)B->npc_talkedto << 13)
|
- ((uint)B->status_word >> 13) & 0x1
+ (uint)B->npc_talkedto
|
- ((uint)B->status_word & 0x2000) >> 13
+ (uint)B->npc_talkedto
|
- (uint)B->status_word & 0x2000
+ ((uint)B->npc_talkedto << 13)
|
- ((uint)B->status_word >> 13) & 0x1U
+ (uint)B->npc_talkedto
|
- ((uint)B->status_word & 0x2000U) >> 13
+ (uint)B->npc_talkedto
|
- (uint)B->status_word & 0x2000U
+ ((uint)B->npc_talkedto << 13)
|
- ((int)B->status_word_signed >> 13) & 0x1
+ (int)B->npc_talkedto
|
- ((int)B->status_word_signed & 0x2000) >> 13
+ (int)B->npc_talkedto
|
- (int)B->status_word_signed & 0x2000
+ ((int)B->npc_talkedto << 13)
|
- ((int)B->status_word_signed >> 13) & 0x1U
+ (uint)B->npc_talkedto
|
- ((int)B->status_word_signed & 0x2000U) >> 13
+ (uint)B->npc_talkedto
|
- (int)B->status_word_signed & 0x2000U
+ ((uint)B->npc_talkedto << 13)
|
- ((uint)B->status_word_signed >> 13) & 0x1
+ (uint)B->npc_talkedto
|
- ((uint)B->status_word_signed & 0x2000) >> 13
+ (uint)B->npc_talkedto
|
- (uint)B->status_word_signed & 0x2000
+ ((uint)B->npc_talkedto << 13)
|
- ((uint)B->status_word_signed >> 13) & 0x1U
+ (uint)B->npc_talkedto
|
- ((uint)B->status_word_signed & 0x2000U) >> 13
+ (uint)B->npc_talkedto
|
- (uint)B->status_word_signed & 0x2000U
+ ((uint)B->npc_talkedto << 13)
)

@promoted_status_word_npc_attitude_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->status_word >> 14) & 0x3
+ (int)B->npc_attitude
|
- ((int)B->status_word & 0xc000) >> 14
+ (int)B->npc_attitude
|
- (int)B->status_word & 0xc000
+ ((int)B->npc_attitude << 14)
|
- ((int)B->status_word >> 14) & 0x3U
+ (uint)B->npc_attitude
|
- ((int)B->status_word & 0xc000U) >> 14
+ (uint)B->npc_attitude
|
- (int)B->status_word & 0xc000U
+ ((uint)B->npc_attitude << 14)
|
- ((uint)B->status_word >> 14) & 0x3
+ (uint)B->npc_attitude
|
- ((uint)B->status_word & 0xc000) >> 14
+ (uint)B->npc_attitude
|
- (uint)B->status_word & 0xc000
+ ((uint)B->npc_attitude << 14)
|
- ((uint)B->status_word >> 14) & 0x3U
+ (uint)B->npc_attitude
|
- ((uint)B->status_word & 0xc000U) >> 14
+ (uint)B->npc_attitude
|
- (uint)B->status_word & 0xc000U
+ ((uint)B->npc_attitude << 14)
|
- ((int)B->status_word_signed >> 14) & 0x3
+ (int)B->npc_attitude
|
- ((int)B->status_word_signed & 0xc000) >> 14
+ (int)B->npc_attitude
|
- (int)B->status_word_signed & 0xc000
+ ((int)B->npc_attitude << 14)
|
- ((int)B->status_word_signed >> 14) & 0x3U
+ (uint)B->npc_attitude
|
- ((int)B->status_word_signed & 0xc000U) >> 14
+ (uint)B->npc_attitude
|
- (int)B->status_word_signed & 0xc000U
+ ((uint)B->npc_attitude << 14)
|
- ((uint)B->status_word_signed >> 14) & 0x3
+ (uint)B->npc_attitude
|
- ((uint)B->status_word_signed & 0xc000) >> 14
+ (uint)B->npc_attitude
|
- (uint)B->status_word_signed & 0xc000
+ ((uint)B->npc_attitude << 14)
|
- ((uint)B->status_word_signed >> 14) & 0x3U
+ (uint)B->npc_attitude
|
- ((uint)B->status_word_signed & 0xc000U) >> 14
+ (uint)B->npc_attitude
|
- (uint)B->status_word_signed & 0xc000U
+ ((uint)B->npc_attitude << 14)
)

@promoted_target_word_npc_target_tile_x_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->target_word >> 0) & 0x3f
+ (int)B->npc_target_tile_x
|
- ((int)B->target_word & 0x3f) >> 0
+ (int)B->npc_target_tile_x
|
- (int)B->target_word & 0x3f
+ (int)B->npc_target_tile_x
|
- ((int)B->target_word >> 0) & 0x3fU
+ (uint)B->npc_target_tile_x
|
- ((int)B->target_word & 0x3fU) >> 0
+ (uint)B->npc_target_tile_x
|
- (int)B->target_word & 0x3fU
+ (uint)B->npc_target_tile_x
|
- ((uint)B->target_word >> 0) & 0x3f
+ (uint)B->npc_target_tile_x
|
- ((uint)B->target_word & 0x3f) >> 0
+ (uint)B->npc_target_tile_x
|
- (uint)B->target_word & 0x3f
+ (uint)B->npc_target_tile_x
|
- ((uint)B->target_word >> 0) & 0x3fU
+ (uint)B->npc_target_tile_x
|
- ((uint)B->target_word & 0x3fU) >> 0
+ (uint)B->npc_target_tile_x
|
- (uint)B->target_word & 0x3fU
+ (uint)B->npc_target_tile_x
|
- ((int)B->target_word_signed >> 0) & 0x3f
+ (int)B->npc_target_tile_x
|
- ((int)B->target_word_signed & 0x3f) >> 0
+ (int)B->npc_target_tile_x
|
- (int)B->target_word_signed & 0x3f
+ (int)B->npc_target_tile_x
|
- ((int)B->target_word_signed >> 0) & 0x3fU
+ (uint)B->npc_target_tile_x
|
- ((int)B->target_word_signed & 0x3fU) >> 0
+ (uint)B->npc_target_tile_x
|
- (int)B->target_word_signed & 0x3fU
+ (uint)B->npc_target_tile_x
|
- ((uint)B->target_word_signed >> 0) & 0x3f
+ (uint)B->npc_target_tile_x
|
- ((uint)B->target_word_signed & 0x3f) >> 0
+ (uint)B->npc_target_tile_x
|
- (uint)B->target_word_signed & 0x3f
+ (uint)B->npc_target_tile_x
|
- ((uint)B->target_word_signed >> 0) & 0x3fU
+ (uint)B->npc_target_tile_x
|
- ((uint)B->target_word_signed & 0x3fU) >> 0
+ (uint)B->npc_target_tile_x
|
- (uint)B->target_word_signed & 0x3fU
+ (uint)B->npc_target_tile_x
)

@promoted_target_word_npc_target_tile_y_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->target_word >> 6) & 0x3f
+ (int)B->npc_target_tile_y
|
- ((int)B->target_word & 0xfc0) >> 6
+ (int)B->npc_target_tile_y
|
- (int)B->target_word & 0xfc0
+ ((int)B->npc_target_tile_y << 6)
|
- ((int)B->target_word >> 6) & 0x3fU
+ (uint)B->npc_target_tile_y
|
- ((int)B->target_word & 0xfc0U) >> 6
+ (uint)B->npc_target_tile_y
|
- (int)B->target_word & 0xfc0U
+ ((uint)B->npc_target_tile_y << 6)
|
- ((uint)B->target_word >> 6) & 0x3f
+ (uint)B->npc_target_tile_y
|
- ((uint)B->target_word & 0xfc0) >> 6
+ (uint)B->npc_target_tile_y
|
- (uint)B->target_word & 0xfc0
+ ((uint)B->npc_target_tile_y << 6)
|
- ((uint)B->target_word >> 6) & 0x3fU
+ (uint)B->npc_target_tile_y
|
- ((uint)B->target_word & 0xfc0U) >> 6
+ (uint)B->npc_target_tile_y
|
- (uint)B->target_word & 0xfc0U
+ ((uint)B->npc_target_tile_y << 6)
|
- ((int)B->target_word_signed >> 6) & 0x3f
+ (int)B->npc_target_tile_y
|
- ((int)B->target_word_signed & 0xfc0) >> 6
+ (int)B->npc_target_tile_y
|
- (int)B->target_word_signed & 0xfc0
+ ((int)B->npc_target_tile_y << 6)
|
- ((int)B->target_word_signed >> 6) & 0x3fU
+ (uint)B->npc_target_tile_y
|
- ((int)B->target_word_signed & 0xfc0U) >> 6
+ (uint)B->npc_target_tile_y
|
- (int)B->target_word_signed & 0xfc0U
+ ((uint)B->npc_target_tile_y << 6)
|
- ((uint)B->target_word_signed >> 6) & 0x3f
+ (uint)B->npc_target_tile_y
|
- ((uint)B->target_word_signed & 0xfc0) >> 6
+ (uint)B->npc_target_tile_y
|
- (uint)B->target_word_signed & 0xfc0
+ ((uint)B->npc_target_tile_y << 6)
|
- ((uint)B->target_word_signed >> 6) & 0x3fU
+ (uint)B->npc_target_tile_y
|
- ((uint)B->target_word_signed & 0xfc0U) >> 6
+ (uint)B->npc_target_tile_y
|
- (uint)B->target_word_signed & 0xfc0U
+ ((uint)B->npc_target_tile_y << 6)
)

@promoted_target_word_npc_swing_charge_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->target_word >> 12) & 0xf
+ (int)B->npc_swing_charge
|
- ((int)B->target_word & 0xf000) >> 12
+ (int)B->npc_swing_charge
|
- (int)B->target_word & 0xf000
+ ((int)B->npc_swing_charge << 12)
|
- ((int)B->target_word >> 12) & 0xfU
+ (uint)B->npc_swing_charge
|
- ((int)B->target_word & 0xf000U) >> 12
+ (uint)B->npc_swing_charge
|
- (int)B->target_word & 0xf000U
+ ((uint)B->npc_swing_charge << 12)
|
- ((uint)B->target_word >> 12) & 0xf
+ (uint)B->npc_swing_charge
|
- ((uint)B->target_word & 0xf000) >> 12
+ (uint)B->npc_swing_charge
|
- (uint)B->target_word & 0xf000
+ ((uint)B->npc_swing_charge << 12)
|
- ((uint)B->target_word >> 12) & 0xfU
+ (uint)B->npc_swing_charge
|
- ((uint)B->target_word & 0xf000U) >> 12
+ (uint)B->npc_swing_charge
|
- (uint)B->target_word & 0xf000U
+ ((uint)B->npc_swing_charge << 12)
|
- ((int)B->target_word_signed >> 12) & 0xf
+ (int)B->npc_swing_charge
|
- ((int)B->target_word_signed & 0xf000) >> 12
+ (int)B->npc_swing_charge
|
- (int)B->target_word_signed & 0xf000
+ ((int)B->npc_swing_charge << 12)
|
- ((int)B->target_word_signed >> 12) & 0xfU
+ (uint)B->npc_swing_charge
|
- ((int)B->target_word_signed & 0xf000U) >> 12
+ (uint)B->npc_swing_charge
|
- (int)B->target_word_signed & 0xf000U
+ ((uint)B->npc_swing_charge << 12)
|
- ((uint)B->target_word_signed >> 12) & 0xf
+ (uint)B->npc_swing_charge
|
- ((uint)B->target_word_signed & 0xf000) >> 12
+ (uint)B->npc_swing_charge
|
- (uint)B->target_word_signed & 0xf000
+ ((uint)B->npc_swing_charge << 12)
|
- ((uint)B->target_word_signed >> 12) & 0xfU
+ (uint)B->npc_swing_charge
|
- ((uint)B->target_word_signed & 0xf000U) >> 12
+ (uint)B->npc_swing_charge
|
- (uint)B->target_word_signed & 0xf000U
+ ((uint)B->npc_swing_charge << 12)
)

@promoted_tile_word_npc_path_slot_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->tile_word >> 0) & 0xf
+ (int)B->npc_path_slot
|
- ((int)B->tile_word & 0xf) >> 0
+ (int)B->npc_path_slot
|
- (int)B->tile_word & 0xf
+ (int)B->npc_path_slot
|
- ((int)B->tile_word >> 0) & 0xfU
+ (uint)B->npc_path_slot
|
- ((int)B->tile_word & 0xfU) >> 0
+ (uint)B->npc_path_slot
|
- (int)B->tile_word & 0xfU
+ (uint)B->npc_path_slot
|
- ((uint)B->tile_word >> 0) & 0xf
+ (uint)B->npc_path_slot
|
- ((uint)B->tile_word & 0xf) >> 0
+ (uint)B->npc_path_slot
|
- (uint)B->tile_word & 0xf
+ (uint)B->npc_path_slot
|
- ((uint)B->tile_word >> 0) & 0xfU
+ (uint)B->npc_path_slot
|
- ((uint)B->tile_word & 0xfU) >> 0
+ (uint)B->npc_path_slot
|
- (uint)B->tile_word & 0xfU
+ (uint)B->npc_path_slot
|
- ((int)B->tile_word_signed >> 0) & 0xf
+ (int)B->npc_path_slot
|
- ((int)B->tile_word_signed & 0xf) >> 0
+ (int)B->npc_path_slot
|
- (int)B->tile_word_signed & 0xf
+ (int)B->npc_path_slot
|
- ((int)B->tile_word_signed >> 0) & 0xfU
+ (uint)B->npc_path_slot
|
- ((int)B->tile_word_signed & 0xfU) >> 0
+ (uint)B->npc_path_slot
|
- (int)B->tile_word_signed & 0xfU
+ (uint)B->npc_path_slot
|
- ((uint)B->tile_word_signed >> 0) & 0xf
+ (uint)B->npc_path_slot
|
- ((uint)B->tile_word_signed & 0xf) >> 0
+ (uint)B->npc_path_slot
|
- (uint)B->tile_word_signed & 0xf
+ (uint)B->npc_path_slot
|
- ((uint)B->tile_word_signed >> 0) & 0xfU
+ (uint)B->npc_path_slot
|
- ((uint)B->tile_word_signed & 0xfU) >> 0
+ (uint)B->npc_path_slot
|
- (uint)B->tile_word_signed & 0xfU
+ (uint)B->npc_path_slot
)

@promoted_tile_word_npc_yhome_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->tile_word >> 4) & 0x3f
+ (int)B->npc_yhome
|
- ((int)B->tile_word & 0x3f0) >> 4
+ (int)B->npc_yhome
|
- (int)B->tile_word & 0x3f0
+ ((int)B->npc_yhome << 4)
|
- ((int)B->tile_word >> 4) & 0x3fU
+ (uint)B->npc_yhome
|
- ((int)B->tile_word & 0x3f0U) >> 4
+ (uint)B->npc_yhome
|
- (int)B->tile_word & 0x3f0U
+ ((uint)B->npc_yhome << 4)
|
- ((uint)B->tile_word >> 4) & 0x3f
+ (uint)B->npc_yhome
|
- ((uint)B->tile_word & 0x3f0) >> 4
+ (uint)B->npc_yhome
|
- (uint)B->tile_word & 0x3f0
+ ((uint)B->npc_yhome << 4)
|
- ((uint)B->tile_word >> 4) & 0x3fU
+ (uint)B->npc_yhome
|
- ((uint)B->tile_word & 0x3f0U) >> 4
+ (uint)B->npc_yhome
|
- (uint)B->tile_word & 0x3f0U
+ ((uint)B->npc_yhome << 4)
|
- ((int)B->tile_word_signed >> 4) & 0x3f
+ (int)B->npc_yhome
|
- ((int)B->tile_word_signed & 0x3f0) >> 4
+ (int)B->npc_yhome
|
- (int)B->tile_word_signed & 0x3f0
+ ((int)B->npc_yhome << 4)
|
- ((int)B->tile_word_signed >> 4) & 0x3fU
+ (uint)B->npc_yhome
|
- ((int)B->tile_word_signed & 0x3f0U) >> 4
+ (uint)B->npc_yhome
|
- (int)B->tile_word_signed & 0x3f0U
+ ((uint)B->npc_yhome << 4)
|
- ((uint)B->tile_word_signed >> 4) & 0x3f
+ (uint)B->npc_yhome
|
- ((uint)B->tile_word_signed & 0x3f0) >> 4
+ (uint)B->npc_yhome
|
- (uint)B->tile_word_signed & 0x3f0
+ ((uint)B->npc_yhome << 4)
|
- ((uint)B->tile_word_signed >> 4) & 0x3fU
+ (uint)B->npc_yhome
|
- ((uint)B->tile_word_signed & 0x3f0U) >> 4
+ (uint)B->npc_yhome
|
- (uint)B->tile_word_signed & 0x3f0U
+ ((uint)B->npc_yhome << 4)
)

@promoted_tile_word_npc_xhome_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->tile_word >> 10) & 0x3f
+ (int)B->npc_xhome
|
- ((int)B->tile_word & 0xfc00) >> 10
+ (int)B->npc_xhome
|
- (int)B->tile_word & 0xfc00
+ ((int)B->npc_xhome << 10)
|
- ((int)B->tile_word >> 10) & 0x3fU
+ (uint)B->npc_xhome
|
- ((int)B->tile_word & 0xfc00U) >> 10
+ (uint)B->npc_xhome
|
- (int)B->tile_word & 0xfc00U
+ ((uint)B->npc_xhome << 10)
|
- ((uint)B->tile_word >> 10) & 0x3f
+ (uint)B->npc_xhome
|
- ((uint)B->tile_word & 0xfc00) >> 10
+ (uint)B->npc_xhome
|
- (uint)B->tile_word & 0xfc00
+ ((uint)B->npc_xhome << 10)
|
- ((uint)B->tile_word >> 10) & 0x3fU
+ (uint)B->npc_xhome
|
- ((uint)B->tile_word & 0xfc00U) >> 10
+ (uint)B->npc_xhome
|
- (uint)B->tile_word & 0xfc00U
+ ((uint)B->npc_xhome << 10)
|
- ((int)B->tile_word_signed >> 10) & 0x3f
+ (int)B->npc_xhome
|
- ((int)B->tile_word_signed & 0xfc00) >> 10
+ (int)B->npc_xhome
|
- (int)B->tile_word_signed & 0xfc00
+ ((int)B->npc_xhome << 10)
|
- ((int)B->tile_word_signed >> 10) & 0x3fU
+ (uint)B->npc_xhome
|
- ((int)B->tile_word_signed & 0xfc00U) >> 10
+ (uint)B->npc_xhome
|
- (int)B->tile_word_signed & 0xfc00U
+ ((uint)B->npc_xhome << 10)
|
- ((uint)B->tile_word_signed >> 10) & 0x3f
+ (uint)B->npc_xhome
|
- ((uint)B->tile_word_signed & 0xfc00) >> 10
+ (uint)B->npc_xhome
|
- (uint)B->tile_word_signed & 0xfc00
+ ((uint)B->npc_xhome << 10)
|
- ((uint)B->tile_word_signed >> 10) & 0x3fU
+ (uint)B->npc_xhome
|
- ((uint)B->tile_word_signed & 0xfc00U) >> 10
+ (uint)B->npc_xhome
|
- (uint)B->tile_word_signed & 0xfc00U
+ ((uint)B->npc_xhome << 10)
)

@promoted_tile_position_tile_y_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->tile_position >> 4) & 0x3f
+ (int)B->tile_y
|
- ((int)B->tile_position & 0x3f0) >> 4
+ (int)B->tile_y
|
- (int)B->tile_position & 0x3f0
+ ((int)B->tile_y << 4)
|
- ((int)B->tile_position >> 4) & 0x3fU
+ (uint)B->tile_y
|
- ((int)B->tile_position & 0x3f0U) >> 4
+ (uint)B->tile_y
|
- (int)B->tile_position & 0x3f0U
+ ((uint)B->tile_y << 4)
|
- ((uint)B->tile_position >> 4) & 0x3f
+ (uint)B->tile_y
|
- ((uint)B->tile_position & 0x3f0) >> 4
+ (uint)B->tile_y
|
- (uint)B->tile_position & 0x3f0
+ ((uint)B->tile_y << 4)
|
- ((uint)B->tile_position >> 4) & 0x3fU
+ (uint)B->tile_y
|
- ((uint)B->tile_position & 0x3f0U) >> 4
+ (uint)B->tile_y
|
- (uint)B->tile_position & 0x3f0U
+ ((uint)B->tile_y << 4)
|
- ((int)B->tile_position_signed >> 4) & 0x3f
+ (int)B->tile_y
|
- ((int)B->tile_position_signed & 0x3f0) >> 4
+ (int)B->tile_y
|
- (int)B->tile_position_signed & 0x3f0
+ ((int)B->tile_y << 4)
|
- ((int)B->tile_position_signed >> 4) & 0x3fU
+ (uint)B->tile_y
|
- ((int)B->tile_position_signed & 0x3f0U) >> 4
+ (uint)B->tile_y
|
- (int)B->tile_position_signed & 0x3f0U
+ ((uint)B->tile_y << 4)
|
- ((uint)B->tile_position_signed >> 4) & 0x3f
+ (uint)B->tile_y
|
- ((uint)B->tile_position_signed & 0x3f0) >> 4
+ (uint)B->tile_y
|
- (uint)B->tile_position_signed & 0x3f0
+ ((uint)B->tile_y << 4)
|
- ((uint)B->tile_position_signed >> 4) & 0x3fU
+ (uint)B->tile_y
|
- ((uint)B->tile_position_signed & 0x3f0U) >> 4
+ (uint)B->tile_y
|
- (uint)B->tile_position_signed & 0x3f0U
+ ((uint)B->tile_y << 4)
)

@promoted_tile_position_tile_x_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->tile_position >> 10) & 0x3f
+ (int)B->tile_x
|
- ((int)B->tile_position & 0xfc00) >> 10
+ (int)B->tile_x
|
- (int)B->tile_position & 0xfc00
+ ((int)B->tile_x << 10)
|
- ((int)B->tile_position >> 10) & 0x3fU
+ (uint)B->tile_x
|
- ((int)B->tile_position & 0xfc00U) >> 10
+ (uint)B->tile_x
|
- (int)B->tile_position & 0xfc00U
+ ((uint)B->tile_x << 10)
|
- ((uint)B->tile_position >> 10) & 0x3f
+ (uint)B->tile_x
|
- ((uint)B->tile_position & 0xfc00) >> 10
+ (uint)B->tile_x
|
- (uint)B->tile_position & 0xfc00
+ ((uint)B->tile_x << 10)
|
- ((uint)B->tile_position >> 10) & 0x3fU
+ (uint)B->tile_x
|
- ((uint)B->tile_position & 0xfc00U) >> 10
+ (uint)B->tile_x
|
- (uint)B->tile_position & 0xfc00U
+ ((uint)B->tile_x << 10)
|
- ((int)B->tile_position_signed >> 10) & 0x3f
+ (int)B->tile_x
|
- ((int)B->tile_position_signed & 0xfc00) >> 10
+ (int)B->tile_x
|
- (int)B->tile_position_signed & 0xfc00
+ ((int)B->tile_x << 10)
|
- ((int)B->tile_position_signed >> 10) & 0x3fU
+ (uint)B->tile_x
|
- ((int)B->tile_position_signed & 0xfc00U) >> 10
+ (uint)B->tile_x
|
- (int)B->tile_position_signed & 0xfc00U
+ ((uint)B->tile_x << 10)
|
- ((uint)B->tile_position_signed >> 10) & 0x3f
+ (uint)B->tile_x
|
- ((uint)B->tile_position_signed & 0xfc00) >> 10
+ (uint)B->tile_x
|
- (uint)B->tile_position_signed & 0xfc00
+ ((uint)B->tile_x << 10)
|
- ((uint)B->tile_position_signed >> 10) & 0x3fU
+ (uint)B->tile_x
|
- ((uint)B->tile_position_signed & 0xfc00U) >> 10
+ (uint)B->tile_x
|
- (uint)B->tile_position_signed & 0xfc00U
+ ((uint)B->tile_x << 10)
)

@promoted_size_weight_collision_radius_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->size_weight >> 0) & 0x7
+ (int)B->collision_radius
|
- ((int)B->size_weight & 0x7) >> 0
+ (int)B->collision_radius
|
- (int)B->size_weight & 0x7
+ (int)B->collision_radius
|
- ((int)B->size_weight >> 0) & 0x7U
+ (uint)B->collision_radius
|
- ((int)B->size_weight & 0x7U) >> 0
+ (uint)B->collision_radius
|
- (int)B->size_weight & 0x7U
+ (uint)B->collision_radius
|
- ((uint)B->size_weight >> 0) & 0x7
+ (uint)B->collision_radius
|
- ((uint)B->size_weight & 0x7) >> 0
+ (uint)B->collision_radius
|
- (uint)B->size_weight & 0x7
+ (uint)B->collision_radius
|
- ((uint)B->size_weight >> 0) & 0x7U
+ (uint)B->collision_radius
|
- ((uint)B->size_weight & 0x7U) >> 0
+ (uint)B->collision_radius
|
- (uint)B->size_weight & 0x7U
+ (uint)B->collision_radius
|
- ((int)B->size_weight_signed >> 0) & 0x7
+ (int)B->collision_radius
|
- ((int)B->size_weight_signed & 0x7) >> 0
+ (int)B->collision_radius
|
- (int)B->size_weight_signed & 0x7
+ (int)B->collision_radius
|
- ((int)B->size_weight_signed >> 0) & 0x7U
+ (uint)B->collision_radius
|
- ((int)B->size_weight_signed & 0x7U) >> 0
+ (uint)B->collision_radius
|
- (int)B->size_weight_signed & 0x7U
+ (uint)B->collision_radius
|
- ((uint)B->size_weight_signed >> 0) & 0x7
+ (uint)B->collision_radius
|
- ((uint)B->size_weight_signed & 0x7) >> 0
+ (uint)B->collision_radius
|
- (uint)B->size_weight_signed & 0x7
+ (uint)B->collision_radius
|
- ((uint)B->size_weight_signed >> 0) & 0x7U
+ (uint)B->collision_radius
|
- ((uint)B->size_weight_signed & 0x7U) >> 0
+ (uint)B->collision_radius
|
- (uint)B->size_weight_signed & 0x7U
+ (uint)B->collision_radius
)

@promoted_size_weight_animated_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->size_weight >> 3) & 0x1
+ (int)B->animated
|
- ((int)B->size_weight & 0x8) >> 3
+ (int)B->animated
|
- (int)B->size_weight & 0x8
+ ((int)B->animated << 3)
|
- ((int)B->size_weight >> 3) & 0x1U
+ (uint)B->animated
|
- ((int)B->size_weight & 0x8U) >> 3
+ (uint)B->animated
|
- (int)B->size_weight & 0x8U
+ ((uint)B->animated << 3)
|
- ((uint)B->size_weight >> 3) & 0x1
+ (uint)B->animated
|
- ((uint)B->size_weight & 0x8) >> 3
+ (uint)B->animated
|
- (uint)B->size_weight & 0x8
+ ((uint)B->animated << 3)
|
- ((uint)B->size_weight >> 3) & 0x1U
+ (uint)B->animated
|
- ((uint)B->size_weight & 0x8U) >> 3
+ (uint)B->animated
|
- (uint)B->size_weight & 0x8U
+ ((uint)B->animated << 3)
|
- ((int)B->size_weight_signed >> 3) & 0x1
+ (int)B->animated
|
- ((int)B->size_weight_signed & 0x8) >> 3
+ (int)B->animated
|
- (int)B->size_weight_signed & 0x8
+ ((int)B->animated << 3)
|
- ((int)B->size_weight_signed >> 3) & 0x1U
+ (uint)B->animated
|
- ((int)B->size_weight_signed & 0x8U) >> 3
+ (uint)B->animated
|
- (int)B->size_weight_signed & 0x8U
+ ((uint)B->animated << 3)
|
- ((uint)B->size_weight_signed >> 3) & 0x1
+ (uint)B->animated
|
- ((uint)B->size_weight_signed & 0x8) >> 3
+ (uint)B->animated
|
- (uint)B->size_weight_signed & 0x8
+ ((uint)B->animated << 3)
|
- ((uint)B->size_weight_signed >> 3) & 0x1U
+ (uint)B->animated
|
- ((uint)B->size_weight_signed & 0x8U) >> 3
+ (uint)B->animated
|
- (uint)B->size_weight_signed & 0x8U
+ ((uint)B->animated << 3)
)

@promoted_size_weight_unit_weight_ptr disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B->size_weight >> 4) & 0xfff
+ (int)B->unit_weight
|
- ((int)B->size_weight & 0xfff0) >> 4
+ (int)B->unit_weight
|
- (int)B->size_weight & 0xfff0
+ ((int)B->unit_weight << 4)
|
- ((int)B->size_weight >> 4) & 0xfffU
+ (uint)B->unit_weight
|
- ((int)B->size_weight & 0xfff0U) >> 4
+ (uint)B->unit_weight
|
- (int)B->size_weight & 0xfff0U
+ ((uint)B->unit_weight << 4)
|
- ((uint)B->size_weight >> 4) & 0xfff
+ (uint)B->unit_weight
|
- ((uint)B->size_weight & 0xfff0) >> 4
+ (uint)B->unit_weight
|
- (uint)B->size_weight & 0xfff0
+ ((uint)B->unit_weight << 4)
|
- ((uint)B->size_weight >> 4) & 0xfffU
+ (uint)B->unit_weight
|
- ((uint)B->size_weight & 0xfff0U) >> 4
+ (uint)B->unit_weight
|
- (uint)B->size_weight & 0xfff0U
+ ((uint)B->unit_weight << 4)
|
- ((int)B->size_weight_signed >> 4) & 0xfff
+ (int)B->unit_weight
|
- ((int)B->size_weight_signed & 0xfff0) >> 4
+ (int)B->unit_weight
|
- (int)B->size_weight_signed & 0xfff0
+ ((int)B->unit_weight << 4)
|
- ((int)B->size_weight_signed >> 4) & 0xfffU
+ (uint)B->unit_weight
|
- ((int)B->size_weight_signed & 0xfff0U) >> 4
+ (uint)B->unit_weight
|
- (int)B->size_weight_signed & 0xfff0U
+ ((uint)B->unit_weight << 4)
|
- ((uint)B->size_weight_signed >> 4) & 0xfff
+ (uint)B->unit_weight
|
- ((uint)B->size_weight_signed & 0xfff0) >> 4
+ (uint)B->unit_weight
|
- (uint)B->size_weight_signed & 0xfff0
+ ((uint)B->unit_weight << 4)
|
- ((uint)B->size_weight_signed >> 4) & 0xfffU
+ (uint)B->unit_weight
|
- ((uint)B->size_weight_signed & 0xfff0U) >> 4
+ (uint)B->unit_weight
|
- (uint)B->size_weight_signed & 0xfff0U
+ ((uint)B->unit_weight << 4)
)

@promoted_type_flags_object_id_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.type_flags >> 0) & 0x1ff
+ (int)B.object_id
|
- ((int)B.type_flags & 0x1ff) >> 0
+ (int)B.object_id
|
- (int)B.type_flags & 0x1ff
+ (int)B.object_id
|
- ((int)B.type_flags >> 0) & 0x1ffU
+ (uint)B.object_id
|
- ((int)B.type_flags & 0x1ffU) >> 0
+ (uint)B.object_id
|
- (int)B.type_flags & 0x1ffU
+ (uint)B.object_id
|
- ((uint)B.type_flags >> 0) & 0x1ff
+ (uint)B.object_id
|
- ((uint)B.type_flags & 0x1ff) >> 0
+ (uint)B.object_id
|
- (uint)B.type_flags & 0x1ff
+ (uint)B.object_id
|
- ((uint)B.type_flags >> 0) & 0x1ffU
+ (uint)B.object_id
|
- ((uint)B.type_flags & 0x1ffU) >> 0
+ (uint)B.object_id
|
- (uint)B.type_flags & 0x1ffU
+ (uint)B.object_id
|
- ((int)B.type_flags_signed >> 0) & 0x1ff
+ (int)B.object_id
|
- ((int)B.type_flags_signed & 0x1ff) >> 0
+ (int)B.object_id
|
- (int)B.type_flags_signed & 0x1ff
+ (int)B.object_id
|
- ((int)B.type_flags_signed >> 0) & 0x1ffU
+ (uint)B.object_id
|
- ((int)B.type_flags_signed & 0x1ffU) >> 0
+ (uint)B.object_id
|
- (int)B.type_flags_signed & 0x1ffU
+ (uint)B.object_id
|
- ((uint)B.type_flags_signed >> 0) & 0x1ff
+ (uint)B.object_id
|
- ((uint)B.type_flags_signed & 0x1ff) >> 0
+ (uint)B.object_id
|
- (uint)B.type_flags_signed & 0x1ff
+ (uint)B.object_id
|
- ((uint)B.type_flags_signed >> 0) & 0x1ffU
+ (uint)B.object_id
|
- ((uint)B.type_flags_signed & 0x1ffU) >> 0
+ (uint)B.object_id
|
- (uint)B.type_flags_signed & 0x1ffU
+ (uint)B.object_id
)

@promoted_type_flags_flags_res_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.type_flags >> 9) & 0x7
+ (int)B.flags_res
|
- ((int)B.type_flags & 0xe00) >> 9
+ (int)B.flags_res
|
- (int)B.type_flags & 0xe00
+ ((int)B.flags_res << 9)
|
- ((int)B.type_flags >> 9) & 0x7U
+ (uint)B.flags_res
|
- ((int)B.type_flags & 0xe00U) >> 9
+ (uint)B.flags_res
|
- (int)B.type_flags & 0xe00U
+ ((uint)B.flags_res << 9)
|
- ((uint)B.type_flags >> 9) & 0x7
+ (uint)B.flags_res
|
- ((uint)B.type_flags & 0xe00) >> 9
+ (uint)B.flags_res
|
- (uint)B.type_flags & 0xe00
+ ((uint)B.flags_res << 9)
|
- ((uint)B.type_flags >> 9) & 0x7U
+ (uint)B.flags_res
|
- ((uint)B.type_flags & 0xe00U) >> 9
+ (uint)B.flags_res
|
- (uint)B.type_flags & 0xe00U
+ ((uint)B.flags_res << 9)
|
- ((int)B.type_flags_signed >> 9) & 0x7
+ (int)B.flags_res
|
- ((int)B.type_flags_signed & 0xe00) >> 9
+ (int)B.flags_res
|
- (int)B.type_flags_signed & 0xe00
+ ((int)B.flags_res << 9)
|
- ((int)B.type_flags_signed >> 9) & 0x7U
+ (uint)B.flags_res
|
- ((int)B.type_flags_signed & 0xe00U) >> 9
+ (uint)B.flags_res
|
- (int)B.type_flags_signed & 0xe00U
+ ((uint)B.flags_res << 9)
|
- ((uint)B.type_flags_signed >> 9) & 0x7
+ (uint)B.flags_res
|
- ((uint)B.type_flags_signed & 0xe00) >> 9
+ (uint)B.flags_res
|
- (uint)B.type_flags_signed & 0xe00
+ ((uint)B.flags_res << 9)
|
- ((uint)B.type_flags_signed >> 9) & 0x7U
+ (uint)B.flags_res
|
- ((uint)B.type_flags_signed & 0xe00U) >> 9
+ (uint)B.flags_res
|
- (uint)B.type_flags_signed & 0xe00U
+ ((uint)B.flags_res << 9)
)

@promoted_type_flags_enchanted_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.type_flags >> 12) & 0x1
+ (int)B.enchanted
|
- ((int)B.type_flags & 0x1000) >> 12
+ (int)B.enchanted
|
- (int)B.type_flags & 0x1000
+ ((int)B.enchanted << 12)
|
- ((int)B.type_flags >> 12) & 0x1U
+ (uint)B.enchanted
|
- ((int)B.type_flags & 0x1000U) >> 12
+ (uint)B.enchanted
|
- (int)B.type_flags & 0x1000U
+ ((uint)B.enchanted << 12)
|
- ((uint)B.type_flags >> 12) & 0x1
+ (uint)B.enchanted
|
- ((uint)B.type_flags & 0x1000) >> 12
+ (uint)B.enchanted
|
- (uint)B.type_flags & 0x1000
+ ((uint)B.enchanted << 12)
|
- ((uint)B.type_flags >> 12) & 0x1U
+ (uint)B.enchanted
|
- ((uint)B.type_flags & 0x1000U) >> 12
+ (uint)B.enchanted
|
- (uint)B.type_flags & 0x1000U
+ ((uint)B.enchanted << 12)
|
- ((int)B.type_flags_signed >> 12) & 0x1
+ (int)B.enchanted
|
- ((int)B.type_flags_signed & 0x1000) >> 12
+ (int)B.enchanted
|
- (int)B.type_flags_signed & 0x1000
+ ((int)B.enchanted << 12)
|
- ((int)B.type_flags_signed >> 12) & 0x1U
+ (uint)B.enchanted
|
- ((int)B.type_flags_signed & 0x1000U) >> 12
+ (uint)B.enchanted
|
- (int)B.type_flags_signed & 0x1000U
+ ((uint)B.enchanted << 12)
|
- ((uint)B.type_flags_signed >> 12) & 0x1
+ (uint)B.enchanted
|
- ((uint)B.type_flags_signed & 0x1000) >> 12
+ (uint)B.enchanted
|
- (uint)B.type_flags_signed & 0x1000
+ ((uint)B.enchanted << 12)
|
- ((uint)B.type_flags_signed >> 12) & 0x1U
+ (uint)B.enchanted
|
- ((uint)B.type_flags_signed & 0x1000U) >> 12
+ (uint)B.enchanted
|
- (uint)B.type_flags_signed & 0x1000U
+ ((uint)B.enchanted << 12)
)

@promoted_type_flags_doordir_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.type_flags >> 13) & 0x1
+ (int)B.doordir
|
- ((int)B.type_flags & 0x2000) >> 13
+ (int)B.doordir
|
- (int)B.type_flags & 0x2000
+ ((int)B.doordir << 13)
|
- ((int)B.type_flags >> 13) & 0x1U
+ (uint)B.doordir
|
- ((int)B.type_flags & 0x2000U) >> 13
+ (uint)B.doordir
|
- (int)B.type_flags & 0x2000U
+ ((uint)B.doordir << 13)
|
- ((uint)B.type_flags >> 13) & 0x1
+ (uint)B.doordir
|
- ((uint)B.type_flags & 0x2000) >> 13
+ (uint)B.doordir
|
- (uint)B.type_flags & 0x2000
+ ((uint)B.doordir << 13)
|
- ((uint)B.type_flags >> 13) & 0x1U
+ (uint)B.doordir
|
- ((uint)B.type_flags & 0x2000U) >> 13
+ (uint)B.doordir
|
- (uint)B.type_flags & 0x2000U
+ ((uint)B.doordir << 13)
|
- ((int)B.type_flags_signed >> 13) & 0x1
+ (int)B.doordir
|
- ((int)B.type_flags_signed & 0x2000) >> 13
+ (int)B.doordir
|
- (int)B.type_flags_signed & 0x2000
+ ((int)B.doordir << 13)
|
- ((int)B.type_flags_signed >> 13) & 0x1U
+ (uint)B.doordir
|
- ((int)B.type_flags_signed & 0x2000U) >> 13
+ (uint)B.doordir
|
- (int)B.type_flags_signed & 0x2000U
+ ((uint)B.doordir << 13)
|
- ((uint)B.type_flags_signed >> 13) & 0x1
+ (uint)B.doordir
|
- ((uint)B.type_flags_signed & 0x2000) >> 13
+ (uint)B.doordir
|
- (uint)B.type_flags_signed & 0x2000
+ ((uint)B.doordir << 13)
|
- ((uint)B.type_flags_signed >> 13) & 0x1U
+ (uint)B.doordir
|
- ((uint)B.type_flags_signed & 0x2000U) >> 13
+ (uint)B.doordir
|
- (uint)B.type_flags_signed & 0x2000U
+ ((uint)B.doordir << 13)
)

@promoted_type_flags_invisible_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.type_flags >> 14) & 0x1
+ (int)B.invisible
|
- ((int)B.type_flags & 0x4000) >> 14
+ (int)B.invisible
|
- (int)B.type_flags & 0x4000
+ ((int)B.invisible << 14)
|
- ((int)B.type_flags >> 14) & 0x1U
+ (uint)B.invisible
|
- ((int)B.type_flags & 0x4000U) >> 14
+ (uint)B.invisible
|
- (int)B.type_flags & 0x4000U
+ ((uint)B.invisible << 14)
|
- ((uint)B.type_flags >> 14) & 0x1
+ (uint)B.invisible
|
- ((uint)B.type_flags & 0x4000) >> 14
+ (uint)B.invisible
|
- (uint)B.type_flags & 0x4000
+ ((uint)B.invisible << 14)
|
- ((uint)B.type_flags >> 14) & 0x1U
+ (uint)B.invisible
|
- ((uint)B.type_flags & 0x4000U) >> 14
+ (uint)B.invisible
|
- (uint)B.type_flags & 0x4000U
+ ((uint)B.invisible << 14)
|
- ((int)B.type_flags_signed >> 14) & 0x1
+ (int)B.invisible
|
- ((int)B.type_flags_signed & 0x4000) >> 14
+ (int)B.invisible
|
- (int)B.type_flags_signed & 0x4000
+ ((int)B.invisible << 14)
|
- ((int)B.type_flags_signed >> 14) & 0x1U
+ (uint)B.invisible
|
- ((int)B.type_flags_signed & 0x4000U) >> 14
+ (uint)B.invisible
|
- (int)B.type_flags_signed & 0x4000U
+ ((uint)B.invisible << 14)
|
- ((uint)B.type_flags_signed >> 14) & 0x1
+ (uint)B.invisible
|
- ((uint)B.type_flags_signed & 0x4000) >> 14
+ (uint)B.invisible
|
- (uint)B.type_flags_signed & 0x4000
+ ((uint)B.invisible << 14)
|
- ((uint)B.type_flags_signed >> 14) & 0x1U
+ (uint)B.invisible
|
- ((uint)B.type_flags_signed & 0x4000U) >> 14
+ (uint)B.invisible
|
- (uint)B.type_flags_signed & 0x4000U
+ ((uint)B.invisible << 14)
)

@promoted_type_flags_is_quant_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.type_flags >> 15) & 0x1
+ (int)B.is_quant
|
- ((int)B.type_flags & 0x8000) >> 15
+ (int)B.is_quant
|
- (int)B.type_flags & 0x8000
+ ((int)B.is_quant << 15)
|
- ((int)B.type_flags >> 15) & 0x1U
+ (uint)B.is_quant
|
- ((int)B.type_flags & 0x8000U) >> 15
+ (uint)B.is_quant
|
- (int)B.type_flags & 0x8000U
+ ((uint)B.is_quant << 15)
|
- ((uint)B.type_flags >> 15) & 0x1
+ (uint)B.is_quant
|
- ((uint)B.type_flags & 0x8000) >> 15
+ (uint)B.is_quant
|
- (uint)B.type_flags & 0x8000
+ ((uint)B.is_quant << 15)
|
- ((uint)B.type_flags >> 15) & 0x1U
+ (uint)B.is_quant
|
- ((uint)B.type_flags & 0x8000U) >> 15
+ (uint)B.is_quant
|
- (uint)B.type_flags & 0x8000U
+ ((uint)B.is_quant << 15)
|
- ((int)B.type_flags_signed >> 15) & 0x1
+ (int)B.is_quant
|
- ((int)B.type_flags_signed & 0x8000) >> 15
+ (int)B.is_quant
|
- (int)B.type_flags_signed & 0x8000
+ ((int)B.is_quant << 15)
|
- ((int)B.type_flags_signed >> 15) & 0x1U
+ (uint)B.is_quant
|
- ((int)B.type_flags_signed & 0x8000U) >> 15
+ (uint)B.is_quant
|
- (int)B.type_flags_signed & 0x8000U
+ ((uint)B.is_quant << 15)
|
- ((uint)B.type_flags_signed >> 15) & 0x1
+ (uint)B.is_quant
|
- ((uint)B.type_flags_signed & 0x8000) >> 15
+ (uint)B.is_quant
|
- (uint)B.type_flags_signed & 0x8000
+ ((uint)B.is_quant << 15)
|
- ((uint)B.type_flags_signed >> 15) & 0x1U
+ (uint)B.is_quant
|
- ((uint)B.type_flags_signed & 0x8000U) >> 15
+ (uint)B.is_quant
|
- (uint)B.type_flags_signed & 0x8000U
+ ((uint)B.is_quant << 15)
)

@promoted_position_word_zpos_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.position_word >> 0) & 0x7f
+ (int)B.zpos
|
- ((int)B.position_word & 0x7f) >> 0
+ (int)B.zpos
|
- (int)B.position_word & 0x7f
+ (int)B.zpos
|
- ((int)B.position_word >> 0) & 0x7fU
+ (uint)B.zpos
|
- ((int)B.position_word & 0x7fU) >> 0
+ (uint)B.zpos
|
- (int)B.position_word & 0x7fU
+ (uint)B.zpos
|
- ((uint)B.position_word >> 0) & 0x7f
+ (uint)B.zpos
|
- ((uint)B.position_word & 0x7f) >> 0
+ (uint)B.zpos
|
- (uint)B.position_word & 0x7f
+ (uint)B.zpos
|
- ((uint)B.position_word >> 0) & 0x7fU
+ (uint)B.zpos
|
- ((uint)B.position_word & 0x7fU) >> 0
+ (uint)B.zpos
|
- (uint)B.position_word & 0x7fU
+ (uint)B.zpos
|
- ((int)B.position_word_signed >> 0) & 0x7f
+ (int)B.zpos
|
- ((int)B.position_word_signed & 0x7f) >> 0
+ (int)B.zpos
|
- (int)B.position_word_signed & 0x7f
+ (int)B.zpos
|
- ((int)B.position_word_signed >> 0) & 0x7fU
+ (uint)B.zpos
|
- ((int)B.position_word_signed & 0x7fU) >> 0
+ (uint)B.zpos
|
- (int)B.position_word_signed & 0x7fU
+ (uint)B.zpos
|
- ((uint)B.position_word_signed >> 0) & 0x7f
+ (uint)B.zpos
|
- ((uint)B.position_word_signed & 0x7f) >> 0
+ (uint)B.zpos
|
- (uint)B.position_word_signed & 0x7f
+ (uint)B.zpos
|
- ((uint)B.position_word_signed >> 0) & 0x7fU
+ (uint)B.zpos
|
- ((uint)B.position_word_signed & 0x7fU) >> 0
+ (uint)B.zpos
|
- (uint)B.position_word_signed & 0x7fU
+ (uint)B.zpos
)

@promoted_position_word_heading_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.position_word >> 7) & 0x7
+ (int)B.heading
|
- ((int)B.position_word & 0x380) >> 7
+ (int)B.heading
|
- (int)B.position_word & 0x380
+ ((int)B.heading << 7)
|
- ((int)B.position_word >> 7) & 0x7U
+ (uint)B.heading
|
- ((int)B.position_word & 0x380U) >> 7
+ (uint)B.heading
|
- (int)B.position_word & 0x380U
+ ((uint)B.heading << 7)
|
- ((uint)B.position_word >> 7) & 0x7
+ (uint)B.heading
|
- ((uint)B.position_word & 0x380) >> 7
+ (uint)B.heading
|
- (uint)B.position_word & 0x380
+ ((uint)B.heading << 7)
|
- ((uint)B.position_word >> 7) & 0x7U
+ (uint)B.heading
|
- ((uint)B.position_word & 0x380U) >> 7
+ (uint)B.heading
|
- (uint)B.position_word & 0x380U
+ ((uint)B.heading << 7)
|
- ((int)B.position_word_signed >> 7) & 0x7
+ (int)B.heading
|
- ((int)B.position_word_signed & 0x380) >> 7
+ (int)B.heading
|
- (int)B.position_word_signed & 0x380
+ ((int)B.heading << 7)
|
- ((int)B.position_word_signed >> 7) & 0x7U
+ (uint)B.heading
|
- ((int)B.position_word_signed & 0x380U) >> 7
+ (uint)B.heading
|
- (int)B.position_word_signed & 0x380U
+ ((uint)B.heading << 7)
|
- ((uint)B.position_word_signed >> 7) & 0x7
+ (uint)B.heading
|
- ((uint)B.position_word_signed & 0x380) >> 7
+ (uint)B.heading
|
- (uint)B.position_word_signed & 0x380
+ ((uint)B.heading << 7)
|
- ((uint)B.position_word_signed >> 7) & 0x7U
+ (uint)B.heading
|
- ((uint)B.position_word_signed & 0x380U) >> 7
+ (uint)B.heading
|
- (uint)B.position_word_signed & 0x380U
+ ((uint)B.heading << 7)
)

@promoted_position_word_ypos_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.position_word >> 10) & 0x7
+ (int)B.ypos
|
- ((int)B.position_word & 0x1c00) >> 10
+ (int)B.ypos
|
- (int)B.position_word & 0x1c00
+ ((int)B.ypos << 10)
|
- ((int)B.position_word >> 10) & 0x7U
+ (uint)B.ypos
|
- ((int)B.position_word & 0x1c00U) >> 10
+ (uint)B.ypos
|
- (int)B.position_word & 0x1c00U
+ ((uint)B.ypos << 10)
|
- ((uint)B.position_word >> 10) & 0x7
+ (uint)B.ypos
|
- ((uint)B.position_word & 0x1c00) >> 10
+ (uint)B.ypos
|
- (uint)B.position_word & 0x1c00
+ ((uint)B.ypos << 10)
|
- ((uint)B.position_word >> 10) & 0x7U
+ (uint)B.ypos
|
- ((uint)B.position_word & 0x1c00U) >> 10
+ (uint)B.ypos
|
- (uint)B.position_word & 0x1c00U
+ ((uint)B.ypos << 10)
|
- ((int)B.position_word_signed >> 10) & 0x7
+ (int)B.ypos
|
- ((int)B.position_word_signed & 0x1c00) >> 10
+ (int)B.ypos
|
- (int)B.position_word_signed & 0x1c00
+ ((int)B.ypos << 10)
|
- ((int)B.position_word_signed >> 10) & 0x7U
+ (uint)B.ypos
|
- ((int)B.position_word_signed & 0x1c00U) >> 10
+ (uint)B.ypos
|
- (int)B.position_word_signed & 0x1c00U
+ ((uint)B.ypos << 10)
|
- ((uint)B.position_word_signed >> 10) & 0x7
+ (uint)B.ypos
|
- ((uint)B.position_word_signed & 0x1c00) >> 10
+ (uint)B.ypos
|
- (uint)B.position_word_signed & 0x1c00
+ ((uint)B.ypos << 10)
|
- ((uint)B.position_word_signed >> 10) & 0x7U
+ (uint)B.ypos
|
- ((uint)B.position_word_signed & 0x1c00U) >> 10
+ (uint)B.ypos
|
- (uint)B.position_word_signed & 0x1c00U
+ ((uint)B.ypos << 10)
)

@promoted_position_word_xpos_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.position_word >> 13) & 0x7
+ (int)B.xpos
|
- ((int)B.position_word & 0xe000) >> 13
+ (int)B.xpos
|
- (int)B.position_word & 0xe000
+ ((int)B.xpos << 13)
|
- ((int)B.position_word >> 13) & 0x7U
+ (uint)B.xpos
|
- ((int)B.position_word & 0xe000U) >> 13
+ (uint)B.xpos
|
- (int)B.position_word & 0xe000U
+ ((uint)B.xpos << 13)
|
- ((uint)B.position_word >> 13) & 0x7
+ (uint)B.xpos
|
- ((uint)B.position_word & 0xe000) >> 13
+ (uint)B.xpos
|
- (uint)B.position_word & 0xe000
+ ((uint)B.xpos << 13)
|
- ((uint)B.position_word >> 13) & 0x7U
+ (uint)B.xpos
|
- ((uint)B.position_word & 0xe000U) >> 13
+ (uint)B.xpos
|
- (uint)B.position_word & 0xe000U
+ ((uint)B.xpos << 13)
|
- ((int)B.position_word_signed >> 13) & 0x7
+ (int)B.xpos
|
- ((int)B.position_word_signed & 0xe000) >> 13
+ (int)B.xpos
|
- (int)B.position_word_signed & 0xe000
+ ((int)B.xpos << 13)
|
- ((int)B.position_word_signed >> 13) & 0x7U
+ (uint)B.xpos
|
- ((int)B.position_word_signed & 0xe000U) >> 13
+ (uint)B.xpos
|
- (int)B.position_word_signed & 0xe000U
+ ((uint)B.xpos << 13)
|
- ((uint)B.position_word_signed >> 13) & 0x7
+ (uint)B.xpos
|
- ((uint)B.position_word_signed & 0xe000) >> 13
+ (uint)B.xpos
|
- (uint)B.position_word_signed & 0xe000
+ ((uint)B.xpos << 13)
|
- ((uint)B.position_word_signed >> 13) & 0x7U
+ (uint)B.xpos
|
- ((uint)B.position_word_signed & 0xe000U) >> 13
+ (uint)B.xpos
|
- (uint)B.position_word_signed & 0xe000U
+ ((uint)B.xpos << 13)
)

@promoted_chain_word_quality_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.chain_word >> 0) & 0x3f
+ (int)B.quality
|
- ((int)B.chain_word & 0x3f) >> 0
+ (int)B.quality
|
- (int)B.chain_word & 0x3f
+ (int)B.quality
|
- ((int)B.chain_word >> 0) & 0x3fU
+ (uint)B.quality
|
- ((int)B.chain_word & 0x3fU) >> 0
+ (uint)B.quality
|
- (int)B.chain_word & 0x3fU
+ (uint)B.quality
|
- ((uint)B.chain_word >> 0) & 0x3f
+ (uint)B.quality
|
- ((uint)B.chain_word & 0x3f) >> 0
+ (uint)B.quality
|
- (uint)B.chain_word & 0x3f
+ (uint)B.quality
|
- ((uint)B.chain_word >> 0) & 0x3fU
+ (uint)B.quality
|
- ((uint)B.chain_word & 0x3fU) >> 0
+ (uint)B.quality
|
- (uint)B.chain_word & 0x3fU
+ (uint)B.quality
|
- ((int)B.chain_word_signed >> 0) & 0x3f
+ (int)B.quality
|
- ((int)B.chain_word_signed & 0x3f) >> 0
+ (int)B.quality
|
- (int)B.chain_word_signed & 0x3f
+ (int)B.quality
|
- ((int)B.chain_word_signed >> 0) & 0x3fU
+ (uint)B.quality
|
- ((int)B.chain_word_signed & 0x3fU) >> 0
+ (uint)B.quality
|
- (int)B.chain_word_signed & 0x3fU
+ (uint)B.quality
|
- ((uint)B.chain_word_signed >> 0) & 0x3f
+ (uint)B.quality
|
- ((uint)B.chain_word_signed & 0x3f) >> 0
+ (uint)B.quality
|
- (uint)B.chain_word_signed & 0x3f
+ (uint)B.quality
|
- ((uint)B.chain_word_signed >> 0) & 0x3fU
+ (uint)B.quality
|
- ((uint)B.chain_word_signed & 0x3fU) >> 0
+ (uint)B.quality
|
- (uint)B.chain_word_signed & 0x3fU
+ (uint)B.quality
)

@promoted_chain_word_next_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.chain_word >> 6) & 0x3ff
+ (int)B.next
|
- ((int)B.chain_word & 0xffc0) >> 6
+ (int)B.next
|
- (int)B.chain_word & 0xffc0
+ ((int)B.next << 6)
|
- ((int)B.chain_word >> 6) & 0x3ffU
+ (uint)B.next
|
- ((int)B.chain_word & 0xffc0U) >> 6
+ (uint)B.next
|
- (int)B.chain_word & 0xffc0U
+ ((uint)B.next << 6)
|
- ((uint)B.chain_word >> 6) & 0x3ff
+ (uint)B.next
|
- ((uint)B.chain_word & 0xffc0) >> 6
+ (uint)B.next
|
- (uint)B.chain_word & 0xffc0
+ ((uint)B.next << 6)
|
- ((uint)B.chain_word >> 6) & 0x3ffU
+ (uint)B.next
|
- ((uint)B.chain_word & 0xffc0U) >> 6
+ (uint)B.next
|
- (uint)B.chain_word & 0xffc0U
+ ((uint)B.next << 6)
|
- ((int)B.chain_word_signed >> 6) & 0x3ff
+ (int)B.next
|
- ((int)B.chain_word_signed & 0xffc0) >> 6
+ (int)B.next
|
- (int)B.chain_word_signed & 0xffc0
+ ((int)B.next << 6)
|
- ((int)B.chain_word_signed >> 6) & 0x3ffU
+ (uint)B.next
|
- ((int)B.chain_word_signed & 0xffc0U) >> 6
+ (uint)B.next
|
- (int)B.chain_word_signed & 0xffc0U
+ ((uint)B.next << 6)
|
- ((uint)B.chain_word_signed >> 6) & 0x3ff
+ (uint)B.next
|
- ((uint)B.chain_word_signed & 0xffc0) >> 6
+ (uint)B.next
|
- (uint)B.chain_word_signed & 0xffc0
+ ((uint)B.next << 6)
|
- ((uint)B.chain_word_signed >> 6) & 0x3ffU
+ (uint)B.next
|
- ((uint)B.chain_word_signed & 0xffc0U) >> 6
+ (uint)B.next
|
- (uint)B.chain_word_signed & 0xffc0U
+ ((uint)B.next << 6)
)

@promoted_link_word_owner_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.link_word >> 0) & 0x3f
+ (int)B.owner
|
- ((int)B.link_word & 0x3f) >> 0
+ (int)B.owner
|
- (int)B.link_word & 0x3f
+ (int)B.owner
|
- ((int)B.link_word >> 0) & 0x3fU
+ (uint)B.owner
|
- ((int)B.link_word & 0x3fU) >> 0
+ (uint)B.owner
|
- (int)B.link_word & 0x3fU
+ (uint)B.owner
|
- ((uint)B.link_word >> 0) & 0x3f
+ (uint)B.owner
|
- ((uint)B.link_word & 0x3f) >> 0
+ (uint)B.owner
|
- (uint)B.link_word & 0x3f
+ (uint)B.owner
|
- ((uint)B.link_word >> 0) & 0x3fU
+ (uint)B.owner
|
- ((uint)B.link_word & 0x3fU) >> 0
+ (uint)B.owner
|
- (uint)B.link_word & 0x3fU
+ (uint)B.owner
|
- ((int)B.link_word_signed >> 0) & 0x3f
+ (int)B.owner
|
- ((int)B.link_word_signed & 0x3f) >> 0
+ (int)B.owner
|
- (int)B.link_word_signed & 0x3f
+ (int)B.owner
|
- ((int)B.link_word_signed >> 0) & 0x3fU
+ (uint)B.owner
|
- ((int)B.link_word_signed & 0x3fU) >> 0
+ (uint)B.owner
|
- (int)B.link_word_signed & 0x3fU
+ (uint)B.owner
|
- ((uint)B.link_word_signed >> 0) & 0x3f
+ (uint)B.owner
|
- ((uint)B.link_word_signed & 0x3f) >> 0
+ (uint)B.owner
|
- (uint)B.link_word_signed & 0x3f
+ (uint)B.owner
|
- ((uint)B.link_word_signed >> 0) & 0x3fU
+ (uint)B.owner
|
- ((uint)B.link_word_signed & 0x3fU) >> 0
+ (uint)B.owner
|
- (uint)B.link_word_signed & 0x3fU
+ (uint)B.owner
)

@promoted_link_word_link_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.link_word >> 6) & 0x3ff
+ (int)B.link
|
- ((int)B.link_word & 0xffc0) >> 6
+ (int)B.link
|
- (int)B.link_word & 0xffc0
+ ((int)B.link << 6)
|
- ((int)B.link_word >> 6) & 0x3ffU
+ (uint)B.link
|
- ((int)B.link_word & 0xffc0U) >> 6
+ (uint)B.link
|
- (int)B.link_word & 0xffc0U
+ ((uint)B.link << 6)
|
- ((uint)B.link_word >> 6) & 0x3ff
+ (uint)B.link
|
- ((uint)B.link_word & 0xffc0) >> 6
+ (uint)B.link
|
- (uint)B.link_word & 0xffc0
+ ((uint)B.link << 6)
|
- ((uint)B.link_word >> 6) & 0x3ffU
+ (uint)B.link
|
- ((uint)B.link_word & 0xffc0U) >> 6
+ (uint)B.link
|
- (uint)B.link_word & 0xffc0U
+ ((uint)B.link << 6)
|
- ((int)B.link_word_signed >> 6) & 0x3ff
+ (int)B.link
|
- ((int)B.link_word_signed & 0xffc0) >> 6
+ (int)B.link
|
- (int)B.link_word_signed & 0xffc0
+ ((int)B.link << 6)
|
- ((int)B.link_word_signed >> 6) & 0x3ffU
+ (uint)B.link
|
- ((int)B.link_word_signed & 0xffc0U) >> 6
+ (uint)B.link
|
- (int)B.link_word_signed & 0xffc0U
+ ((uint)B.link << 6)
|
- ((uint)B.link_word_signed >> 6) & 0x3ff
+ (uint)B.link
|
- ((uint)B.link_word_signed & 0xffc0) >> 6
+ (uint)B.link
|
- (uint)B.link_word_signed & 0xffc0
+ ((uint)B.link << 6)
|
- ((uint)B.link_word_signed >> 6) & 0x3ffU
+ (uint)B.link
|
- ((uint)B.link_word_signed & 0xffc0U) >> 6
+ (uint)B.link
|
- (uint)B.link_word_signed & 0xffc0U
+ ((uint)B.link << 6)
)

@promoted_goal_word_npc_goal_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.goal_word >> 0) & 0xf
+ (int)B.npc_goal
|
- ((int)B.goal_word & 0xf) >> 0
+ (int)B.npc_goal
|
- (int)B.goal_word & 0xf
+ (int)B.npc_goal
|
- ((int)B.goal_word >> 0) & 0xfU
+ (uint)B.npc_goal
|
- ((int)B.goal_word & 0xfU) >> 0
+ (uint)B.npc_goal
|
- (int)B.goal_word & 0xfU
+ (uint)B.npc_goal
|
- ((uint)B.goal_word >> 0) & 0xf
+ (uint)B.npc_goal
|
- ((uint)B.goal_word & 0xf) >> 0
+ (uint)B.npc_goal
|
- (uint)B.goal_word & 0xf
+ (uint)B.npc_goal
|
- ((uint)B.goal_word >> 0) & 0xfU
+ (uint)B.npc_goal
|
- ((uint)B.goal_word & 0xfU) >> 0
+ (uint)B.npc_goal
|
- (uint)B.goal_word & 0xfU
+ (uint)B.npc_goal
|
- ((int)B.goal_word_signed >> 0) & 0xf
+ (int)B.npc_goal
|
- ((int)B.goal_word_signed & 0xf) >> 0
+ (int)B.npc_goal
|
- (int)B.goal_word_signed & 0xf
+ (int)B.npc_goal
|
- ((int)B.goal_word_signed >> 0) & 0xfU
+ (uint)B.npc_goal
|
- ((int)B.goal_word_signed & 0xfU) >> 0
+ (uint)B.npc_goal
|
- (int)B.goal_word_signed & 0xfU
+ (uint)B.npc_goal
|
- ((uint)B.goal_word_signed >> 0) & 0xf
+ (uint)B.npc_goal
|
- ((uint)B.goal_word_signed & 0xf) >> 0
+ (uint)B.npc_goal
|
- (uint)B.goal_word_signed & 0xf
+ (uint)B.npc_goal
|
- ((uint)B.goal_word_signed >> 0) & 0xfU
+ (uint)B.npc_goal
|
- ((uint)B.goal_word_signed & 0xfU) >> 0
+ (uint)B.npc_goal
|
- (uint)B.goal_word_signed & 0xfU
+ (uint)B.npc_goal
)

@promoted_goal_word_npc_gtarg_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.goal_word >> 4) & 0xff
+ (int)B.npc_gtarg
|
- ((int)B.goal_word & 0xff0) >> 4
+ (int)B.npc_gtarg
|
- (int)B.goal_word & 0xff0
+ ((int)B.npc_gtarg << 4)
|
- ((int)B.goal_word >> 4) & 0xffU
+ (uint)B.npc_gtarg
|
- ((int)B.goal_word & 0xff0U) >> 4
+ (uint)B.npc_gtarg
|
- (int)B.goal_word & 0xff0U
+ ((uint)B.npc_gtarg << 4)
|
- ((uint)B.goal_word >> 4) & 0xff
+ (uint)B.npc_gtarg
|
- ((uint)B.goal_word & 0xff0) >> 4
+ (uint)B.npc_gtarg
|
- (uint)B.goal_word & 0xff0
+ ((uint)B.npc_gtarg << 4)
|
- ((uint)B.goal_word >> 4) & 0xffU
+ (uint)B.npc_gtarg
|
- ((uint)B.goal_word & 0xff0U) >> 4
+ (uint)B.npc_gtarg
|
- (uint)B.goal_word & 0xff0U
+ ((uint)B.npc_gtarg << 4)
|
- ((int)B.goal_word_signed >> 4) & 0xff
+ (int)B.npc_gtarg
|
- ((int)B.goal_word_signed & 0xff0) >> 4
+ (int)B.npc_gtarg
|
- (int)B.goal_word_signed & 0xff0
+ ((int)B.npc_gtarg << 4)
|
- ((int)B.goal_word_signed >> 4) & 0xffU
+ (uint)B.npc_gtarg
|
- ((int)B.goal_word_signed & 0xff0U) >> 4
+ (uint)B.npc_gtarg
|
- (int)B.goal_word_signed & 0xff0U
+ ((uint)B.npc_gtarg << 4)
|
- ((uint)B.goal_word_signed >> 4) & 0xff
+ (uint)B.npc_gtarg
|
- ((uint)B.goal_word_signed & 0xff0) >> 4
+ (uint)B.npc_gtarg
|
- (uint)B.goal_word_signed & 0xff0
+ ((uint)B.npc_gtarg << 4)
|
- ((uint)B.goal_word_signed >> 4) & 0xffU
+ (uint)B.npc_gtarg
|
- ((uint)B.goal_word_signed & 0xff0U) >> 4
+ (uint)B.npc_gtarg
|
- (uint)B.goal_word_signed & 0xff0U
+ ((uint)B.npc_gtarg << 4)
)

@promoted_goal_word_npc_animation_frame_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.goal_word >> 12) & 0xf
+ (int)B.npc_animation_frame
|
- ((int)B.goal_word & 0xf000) >> 12
+ (int)B.npc_animation_frame
|
- (int)B.goal_word & 0xf000
+ ((int)B.npc_animation_frame << 12)
|
- ((int)B.goal_word >> 12) & 0xfU
+ (uint)B.npc_animation_frame
|
- ((int)B.goal_word & 0xf000U) >> 12
+ (uint)B.npc_animation_frame
|
- (int)B.goal_word & 0xf000U
+ ((uint)B.npc_animation_frame << 12)
|
- ((uint)B.goal_word >> 12) & 0xf
+ (uint)B.npc_animation_frame
|
- ((uint)B.goal_word & 0xf000) >> 12
+ (uint)B.npc_animation_frame
|
- (uint)B.goal_word & 0xf000
+ ((uint)B.npc_animation_frame << 12)
|
- ((uint)B.goal_word >> 12) & 0xfU
+ (uint)B.npc_animation_frame
|
- ((uint)B.goal_word & 0xf000U) >> 12
+ (uint)B.npc_animation_frame
|
- (uint)B.goal_word & 0xf000U
+ ((uint)B.npc_animation_frame << 12)
|
- ((int)B.goal_word_signed >> 12) & 0xf
+ (int)B.npc_animation_frame
|
- ((int)B.goal_word_signed & 0xf000) >> 12
+ (int)B.npc_animation_frame
|
- (int)B.goal_word_signed & 0xf000
+ ((int)B.npc_animation_frame << 12)
|
- ((int)B.goal_word_signed >> 12) & 0xfU
+ (uint)B.npc_animation_frame
|
- ((int)B.goal_word_signed & 0xf000U) >> 12
+ (uint)B.npc_animation_frame
|
- (int)B.goal_word_signed & 0xf000U
+ ((uint)B.npc_animation_frame << 12)
|
- ((uint)B.goal_word_signed >> 12) & 0xf
+ (uint)B.npc_animation_frame
|
- ((uint)B.goal_word_signed & 0xf000) >> 12
+ (uint)B.npc_animation_frame
|
- (uint)B.goal_word_signed & 0xf000
+ ((uint)B.npc_animation_frame << 12)
|
- ((uint)B.goal_word_signed >> 12) & 0xfU
+ (uint)B.npc_animation_frame
|
- ((uint)B.goal_word_signed & 0xf000U) >> 12
+ (uint)B.npc_animation_frame
|
- (uint)B.goal_word_signed & 0xf000U
+ ((uint)B.npc_animation_frame << 12)
)

@promoted_status_word_npc_level_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.status_word >> 0) & 0xf
+ (int)B.npc_level
|
- ((int)B.status_word & 0xf) >> 0
+ (int)B.npc_level
|
- (int)B.status_word & 0xf
+ (int)B.npc_level
|
- ((int)B.status_word >> 0) & 0xfU
+ (uint)B.npc_level
|
- ((int)B.status_word & 0xfU) >> 0
+ (uint)B.npc_level
|
- (int)B.status_word & 0xfU
+ (uint)B.npc_level
|
- ((uint)B.status_word >> 0) & 0xf
+ (uint)B.npc_level
|
- ((uint)B.status_word & 0xf) >> 0
+ (uint)B.npc_level
|
- (uint)B.status_word & 0xf
+ (uint)B.npc_level
|
- ((uint)B.status_word >> 0) & 0xfU
+ (uint)B.npc_level
|
- ((uint)B.status_word & 0xfU) >> 0
+ (uint)B.npc_level
|
- (uint)B.status_word & 0xfU
+ (uint)B.npc_level
|
- ((int)B.status_word_signed >> 0) & 0xf
+ (int)B.npc_level
|
- ((int)B.status_word_signed & 0xf) >> 0
+ (int)B.npc_level
|
- (int)B.status_word_signed & 0xf
+ (int)B.npc_level
|
- ((int)B.status_word_signed >> 0) & 0xfU
+ (uint)B.npc_level
|
- ((int)B.status_word_signed & 0xfU) >> 0
+ (uint)B.npc_level
|
- (int)B.status_word_signed & 0xfU
+ (uint)B.npc_level
|
- ((uint)B.status_word_signed >> 0) & 0xf
+ (uint)B.npc_level
|
- ((uint)B.status_word_signed & 0xf) >> 0
+ (uint)B.npc_level
|
- (uint)B.status_word_signed & 0xf
+ (uint)B.npc_level
|
- ((uint)B.status_word_signed >> 0) & 0xfU
+ (uint)B.npc_level
|
- ((uint)B.status_word_signed & 0xfU) >> 0
+ (uint)B.npc_level
|
- (uint)B.status_word_signed & 0xfU
+ (uint)B.npc_level
)

@promoted_status_word_npc_talkedto_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.status_word >> 13) & 0x1
+ (int)B.npc_talkedto
|
- ((int)B.status_word & 0x2000) >> 13
+ (int)B.npc_talkedto
|
- (int)B.status_word & 0x2000
+ ((int)B.npc_talkedto << 13)
|
- ((int)B.status_word >> 13) & 0x1U
+ (uint)B.npc_talkedto
|
- ((int)B.status_word & 0x2000U) >> 13
+ (uint)B.npc_talkedto
|
- (int)B.status_word & 0x2000U
+ ((uint)B.npc_talkedto << 13)
|
- ((uint)B.status_word >> 13) & 0x1
+ (uint)B.npc_talkedto
|
- ((uint)B.status_word & 0x2000) >> 13
+ (uint)B.npc_talkedto
|
- (uint)B.status_word & 0x2000
+ ((uint)B.npc_talkedto << 13)
|
- ((uint)B.status_word >> 13) & 0x1U
+ (uint)B.npc_talkedto
|
- ((uint)B.status_word & 0x2000U) >> 13
+ (uint)B.npc_talkedto
|
- (uint)B.status_word & 0x2000U
+ ((uint)B.npc_talkedto << 13)
|
- ((int)B.status_word_signed >> 13) & 0x1
+ (int)B.npc_talkedto
|
- ((int)B.status_word_signed & 0x2000) >> 13
+ (int)B.npc_talkedto
|
- (int)B.status_word_signed & 0x2000
+ ((int)B.npc_talkedto << 13)
|
- ((int)B.status_word_signed >> 13) & 0x1U
+ (uint)B.npc_talkedto
|
- ((int)B.status_word_signed & 0x2000U) >> 13
+ (uint)B.npc_talkedto
|
- (int)B.status_word_signed & 0x2000U
+ ((uint)B.npc_talkedto << 13)
|
- ((uint)B.status_word_signed >> 13) & 0x1
+ (uint)B.npc_talkedto
|
- ((uint)B.status_word_signed & 0x2000) >> 13
+ (uint)B.npc_talkedto
|
- (uint)B.status_word_signed & 0x2000
+ ((uint)B.npc_talkedto << 13)
|
- ((uint)B.status_word_signed >> 13) & 0x1U
+ (uint)B.npc_talkedto
|
- ((uint)B.status_word_signed & 0x2000U) >> 13
+ (uint)B.npc_talkedto
|
- (uint)B.status_word_signed & 0x2000U
+ ((uint)B.npc_talkedto << 13)
)

@promoted_status_word_npc_attitude_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.status_word >> 14) & 0x3
+ (int)B.npc_attitude
|
- ((int)B.status_word & 0xc000) >> 14
+ (int)B.npc_attitude
|
- (int)B.status_word & 0xc000
+ ((int)B.npc_attitude << 14)
|
- ((int)B.status_word >> 14) & 0x3U
+ (uint)B.npc_attitude
|
- ((int)B.status_word & 0xc000U) >> 14
+ (uint)B.npc_attitude
|
- (int)B.status_word & 0xc000U
+ ((uint)B.npc_attitude << 14)
|
- ((uint)B.status_word >> 14) & 0x3
+ (uint)B.npc_attitude
|
- ((uint)B.status_word & 0xc000) >> 14
+ (uint)B.npc_attitude
|
- (uint)B.status_word & 0xc000
+ ((uint)B.npc_attitude << 14)
|
- ((uint)B.status_word >> 14) & 0x3U
+ (uint)B.npc_attitude
|
- ((uint)B.status_word & 0xc000U) >> 14
+ (uint)B.npc_attitude
|
- (uint)B.status_word & 0xc000U
+ ((uint)B.npc_attitude << 14)
|
- ((int)B.status_word_signed >> 14) & 0x3
+ (int)B.npc_attitude
|
- ((int)B.status_word_signed & 0xc000) >> 14
+ (int)B.npc_attitude
|
- (int)B.status_word_signed & 0xc000
+ ((int)B.npc_attitude << 14)
|
- ((int)B.status_word_signed >> 14) & 0x3U
+ (uint)B.npc_attitude
|
- ((int)B.status_word_signed & 0xc000U) >> 14
+ (uint)B.npc_attitude
|
- (int)B.status_word_signed & 0xc000U
+ ((uint)B.npc_attitude << 14)
|
- ((uint)B.status_word_signed >> 14) & 0x3
+ (uint)B.npc_attitude
|
- ((uint)B.status_word_signed & 0xc000) >> 14
+ (uint)B.npc_attitude
|
- (uint)B.status_word_signed & 0xc000
+ ((uint)B.npc_attitude << 14)
|
- ((uint)B.status_word_signed >> 14) & 0x3U
+ (uint)B.npc_attitude
|
- ((uint)B.status_word_signed & 0xc000U) >> 14
+ (uint)B.npc_attitude
|
- (uint)B.status_word_signed & 0xc000U
+ ((uint)B.npc_attitude << 14)
)

@promoted_target_word_npc_target_tile_x_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.target_word >> 0) & 0x3f
+ (int)B.npc_target_tile_x
|
- ((int)B.target_word & 0x3f) >> 0
+ (int)B.npc_target_tile_x
|
- (int)B.target_word & 0x3f
+ (int)B.npc_target_tile_x
|
- ((int)B.target_word >> 0) & 0x3fU
+ (uint)B.npc_target_tile_x
|
- ((int)B.target_word & 0x3fU) >> 0
+ (uint)B.npc_target_tile_x
|
- (int)B.target_word & 0x3fU
+ (uint)B.npc_target_tile_x
|
- ((uint)B.target_word >> 0) & 0x3f
+ (uint)B.npc_target_tile_x
|
- ((uint)B.target_word & 0x3f) >> 0
+ (uint)B.npc_target_tile_x
|
- (uint)B.target_word & 0x3f
+ (uint)B.npc_target_tile_x
|
- ((uint)B.target_word >> 0) & 0x3fU
+ (uint)B.npc_target_tile_x
|
- ((uint)B.target_word & 0x3fU) >> 0
+ (uint)B.npc_target_tile_x
|
- (uint)B.target_word & 0x3fU
+ (uint)B.npc_target_tile_x
|
- ((int)B.target_word_signed >> 0) & 0x3f
+ (int)B.npc_target_tile_x
|
- ((int)B.target_word_signed & 0x3f) >> 0
+ (int)B.npc_target_tile_x
|
- (int)B.target_word_signed & 0x3f
+ (int)B.npc_target_tile_x
|
- ((int)B.target_word_signed >> 0) & 0x3fU
+ (uint)B.npc_target_tile_x
|
- ((int)B.target_word_signed & 0x3fU) >> 0
+ (uint)B.npc_target_tile_x
|
- (int)B.target_word_signed & 0x3fU
+ (uint)B.npc_target_tile_x
|
- ((uint)B.target_word_signed >> 0) & 0x3f
+ (uint)B.npc_target_tile_x
|
- ((uint)B.target_word_signed & 0x3f) >> 0
+ (uint)B.npc_target_tile_x
|
- (uint)B.target_word_signed & 0x3f
+ (uint)B.npc_target_tile_x
|
- ((uint)B.target_word_signed >> 0) & 0x3fU
+ (uint)B.npc_target_tile_x
|
- ((uint)B.target_word_signed & 0x3fU) >> 0
+ (uint)B.npc_target_tile_x
|
- (uint)B.target_word_signed & 0x3fU
+ (uint)B.npc_target_tile_x
)

@promoted_target_word_npc_target_tile_y_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.target_word >> 6) & 0x3f
+ (int)B.npc_target_tile_y
|
- ((int)B.target_word & 0xfc0) >> 6
+ (int)B.npc_target_tile_y
|
- (int)B.target_word & 0xfc0
+ ((int)B.npc_target_tile_y << 6)
|
- ((int)B.target_word >> 6) & 0x3fU
+ (uint)B.npc_target_tile_y
|
- ((int)B.target_word & 0xfc0U) >> 6
+ (uint)B.npc_target_tile_y
|
- (int)B.target_word & 0xfc0U
+ ((uint)B.npc_target_tile_y << 6)
|
- ((uint)B.target_word >> 6) & 0x3f
+ (uint)B.npc_target_tile_y
|
- ((uint)B.target_word & 0xfc0) >> 6
+ (uint)B.npc_target_tile_y
|
- (uint)B.target_word & 0xfc0
+ ((uint)B.npc_target_tile_y << 6)
|
- ((uint)B.target_word >> 6) & 0x3fU
+ (uint)B.npc_target_tile_y
|
- ((uint)B.target_word & 0xfc0U) >> 6
+ (uint)B.npc_target_tile_y
|
- (uint)B.target_word & 0xfc0U
+ ((uint)B.npc_target_tile_y << 6)
|
- ((int)B.target_word_signed >> 6) & 0x3f
+ (int)B.npc_target_tile_y
|
- ((int)B.target_word_signed & 0xfc0) >> 6
+ (int)B.npc_target_tile_y
|
- (int)B.target_word_signed & 0xfc0
+ ((int)B.npc_target_tile_y << 6)
|
- ((int)B.target_word_signed >> 6) & 0x3fU
+ (uint)B.npc_target_tile_y
|
- ((int)B.target_word_signed & 0xfc0U) >> 6
+ (uint)B.npc_target_tile_y
|
- (int)B.target_word_signed & 0xfc0U
+ ((uint)B.npc_target_tile_y << 6)
|
- ((uint)B.target_word_signed >> 6) & 0x3f
+ (uint)B.npc_target_tile_y
|
- ((uint)B.target_word_signed & 0xfc0) >> 6
+ (uint)B.npc_target_tile_y
|
- (uint)B.target_word_signed & 0xfc0
+ ((uint)B.npc_target_tile_y << 6)
|
- ((uint)B.target_word_signed >> 6) & 0x3fU
+ (uint)B.npc_target_tile_y
|
- ((uint)B.target_word_signed & 0xfc0U) >> 6
+ (uint)B.npc_target_tile_y
|
- (uint)B.target_word_signed & 0xfc0U
+ ((uint)B.npc_target_tile_y << 6)
)

@promoted_target_word_npc_swing_charge_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.target_word >> 12) & 0xf
+ (int)B.npc_swing_charge
|
- ((int)B.target_word & 0xf000) >> 12
+ (int)B.npc_swing_charge
|
- (int)B.target_word & 0xf000
+ ((int)B.npc_swing_charge << 12)
|
- ((int)B.target_word >> 12) & 0xfU
+ (uint)B.npc_swing_charge
|
- ((int)B.target_word & 0xf000U) >> 12
+ (uint)B.npc_swing_charge
|
- (int)B.target_word & 0xf000U
+ ((uint)B.npc_swing_charge << 12)
|
- ((uint)B.target_word >> 12) & 0xf
+ (uint)B.npc_swing_charge
|
- ((uint)B.target_word & 0xf000) >> 12
+ (uint)B.npc_swing_charge
|
- (uint)B.target_word & 0xf000
+ ((uint)B.npc_swing_charge << 12)
|
- ((uint)B.target_word >> 12) & 0xfU
+ (uint)B.npc_swing_charge
|
- ((uint)B.target_word & 0xf000U) >> 12
+ (uint)B.npc_swing_charge
|
- (uint)B.target_word & 0xf000U
+ ((uint)B.npc_swing_charge << 12)
|
- ((int)B.target_word_signed >> 12) & 0xf
+ (int)B.npc_swing_charge
|
- ((int)B.target_word_signed & 0xf000) >> 12
+ (int)B.npc_swing_charge
|
- (int)B.target_word_signed & 0xf000
+ ((int)B.npc_swing_charge << 12)
|
- ((int)B.target_word_signed >> 12) & 0xfU
+ (uint)B.npc_swing_charge
|
- ((int)B.target_word_signed & 0xf000U) >> 12
+ (uint)B.npc_swing_charge
|
- (int)B.target_word_signed & 0xf000U
+ ((uint)B.npc_swing_charge << 12)
|
- ((uint)B.target_word_signed >> 12) & 0xf
+ (uint)B.npc_swing_charge
|
- ((uint)B.target_word_signed & 0xf000) >> 12
+ (uint)B.npc_swing_charge
|
- (uint)B.target_word_signed & 0xf000
+ ((uint)B.npc_swing_charge << 12)
|
- ((uint)B.target_word_signed >> 12) & 0xfU
+ (uint)B.npc_swing_charge
|
- ((uint)B.target_word_signed & 0xf000U) >> 12
+ (uint)B.npc_swing_charge
|
- (uint)B.target_word_signed & 0xf000U
+ ((uint)B.npc_swing_charge << 12)
)

@promoted_tile_word_npc_path_slot_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.tile_word >> 0) & 0xf
+ (int)B.npc_path_slot
|
- ((int)B.tile_word & 0xf) >> 0
+ (int)B.npc_path_slot
|
- (int)B.tile_word & 0xf
+ (int)B.npc_path_slot
|
- ((int)B.tile_word >> 0) & 0xfU
+ (uint)B.npc_path_slot
|
- ((int)B.tile_word & 0xfU) >> 0
+ (uint)B.npc_path_slot
|
- (int)B.tile_word & 0xfU
+ (uint)B.npc_path_slot
|
- ((uint)B.tile_word >> 0) & 0xf
+ (uint)B.npc_path_slot
|
- ((uint)B.tile_word & 0xf) >> 0
+ (uint)B.npc_path_slot
|
- (uint)B.tile_word & 0xf
+ (uint)B.npc_path_slot
|
- ((uint)B.tile_word >> 0) & 0xfU
+ (uint)B.npc_path_slot
|
- ((uint)B.tile_word & 0xfU) >> 0
+ (uint)B.npc_path_slot
|
- (uint)B.tile_word & 0xfU
+ (uint)B.npc_path_slot
|
- ((int)B.tile_word_signed >> 0) & 0xf
+ (int)B.npc_path_slot
|
- ((int)B.tile_word_signed & 0xf) >> 0
+ (int)B.npc_path_slot
|
- (int)B.tile_word_signed & 0xf
+ (int)B.npc_path_slot
|
- ((int)B.tile_word_signed >> 0) & 0xfU
+ (uint)B.npc_path_slot
|
- ((int)B.tile_word_signed & 0xfU) >> 0
+ (uint)B.npc_path_slot
|
- (int)B.tile_word_signed & 0xfU
+ (uint)B.npc_path_slot
|
- ((uint)B.tile_word_signed >> 0) & 0xf
+ (uint)B.npc_path_slot
|
- ((uint)B.tile_word_signed & 0xf) >> 0
+ (uint)B.npc_path_slot
|
- (uint)B.tile_word_signed & 0xf
+ (uint)B.npc_path_slot
|
- ((uint)B.tile_word_signed >> 0) & 0xfU
+ (uint)B.npc_path_slot
|
- ((uint)B.tile_word_signed & 0xfU) >> 0
+ (uint)B.npc_path_slot
|
- (uint)B.tile_word_signed & 0xfU
+ (uint)B.npc_path_slot
)

@promoted_tile_word_npc_yhome_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.tile_word >> 4) & 0x3f
+ (int)B.npc_yhome
|
- ((int)B.tile_word & 0x3f0) >> 4
+ (int)B.npc_yhome
|
- (int)B.tile_word & 0x3f0
+ ((int)B.npc_yhome << 4)
|
- ((int)B.tile_word >> 4) & 0x3fU
+ (uint)B.npc_yhome
|
- ((int)B.tile_word & 0x3f0U) >> 4
+ (uint)B.npc_yhome
|
- (int)B.tile_word & 0x3f0U
+ ((uint)B.npc_yhome << 4)
|
- ((uint)B.tile_word >> 4) & 0x3f
+ (uint)B.npc_yhome
|
- ((uint)B.tile_word & 0x3f0) >> 4
+ (uint)B.npc_yhome
|
- (uint)B.tile_word & 0x3f0
+ ((uint)B.npc_yhome << 4)
|
- ((uint)B.tile_word >> 4) & 0x3fU
+ (uint)B.npc_yhome
|
- ((uint)B.tile_word & 0x3f0U) >> 4
+ (uint)B.npc_yhome
|
- (uint)B.tile_word & 0x3f0U
+ ((uint)B.npc_yhome << 4)
|
- ((int)B.tile_word_signed >> 4) & 0x3f
+ (int)B.npc_yhome
|
- ((int)B.tile_word_signed & 0x3f0) >> 4
+ (int)B.npc_yhome
|
- (int)B.tile_word_signed & 0x3f0
+ ((int)B.npc_yhome << 4)
|
- ((int)B.tile_word_signed >> 4) & 0x3fU
+ (uint)B.npc_yhome
|
- ((int)B.tile_word_signed & 0x3f0U) >> 4
+ (uint)B.npc_yhome
|
- (int)B.tile_word_signed & 0x3f0U
+ ((uint)B.npc_yhome << 4)
|
- ((uint)B.tile_word_signed >> 4) & 0x3f
+ (uint)B.npc_yhome
|
- ((uint)B.tile_word_signed & 0x3f0) >> 4
+ (uint)B.npc_yhome
|
- (uint)B.tile_word_signed & 0x3f0
+ ((uint)B.npc_yhome << 4)
|
- ((uint)B.tile_word_signed >> 4) & 0x3fU
+ (uint)B.npc_yhome
|
- ((uint)B.tile_word_signed & 0x3f0U) >> 4
+ (uint)B.npc_yhome
|
- (uint)B.tile_word_signed & 0x3f0U
+ ((uint)B.npc_yhome << 4)
)

@promoted_tile_word_npc_xhome_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.tile_word >> 10) & 0x3f
+ (int)B.npc_xhome
|
- ((int)B.tile_word & 0xfc00) >> 10
+ (int)B.npc_xhome
|
- (int)B.tile_word & 0xfc00
+ ((int)B.npc_xhome << 10)
|
- ((int)B.tile_word >> 10) & 0x3fU
+ (uint)B.npc_xhome
|
- ((int)B.tile_word & 0xfc00U) >> 10
+ (uint)B.npc_xhome
|
- (int)B.tile_word & 0xfc00U
+ ((uint)B.npc_xhome << 10)
|
- ((uint)B.tile_word >> 10) & 0x3f
+ (uint)B.npc_xhome
|
- ((uint)B.tile_word & 0xfc00) >> 10
+ (uint)B.npc_xhome
|
- (uint)B.tile_word & 0xfc00
+ ((uint)B.npc_xhome << 10)
|
- ((uint)B.tile_word >> 10) & 0x3fU
+ (uint)B.npc_xhome
|
- ((uint)B.tile_word & 0xfc00U) >> 10
+ (uint)B.npc_xhome
|
- (uint)B.tile_word & 0xfc00U
+ ((uint)B.npc_xhome << 10)
|
- ((int)B.tile_word_signed >> 10) & 0x3f
+ (int)B.npc_xhome
|
- ((int)B.tile_word_signed & 0xfc00) >> 10
+ (int)B.npc_xhome
|
- (int)B.tile_word_signed & 0xfc00
+ ((int)B.npc_xhome << 10)
|
- ((int)B.tile_word_signed >> 10) & 0x3fU
+ (uint)B.npc_xhome
|
- ((int)B.tile_word_signed & 0xfc00U) >> 10
+ (uint)B.npc_xhome
|
- (int)B.tile_word_signed & 0xfc00U
+ ((uint)B.npc_xhome << 10)
|
- ((uint)B.tile_word_signed >> 10) & 0x3f
+ (uint)B.npc_xhome
|
- ((uint)B.tile_word_signed & 0xfc00) >> 10
+ (uint)B.npc_xhome
|
- (uint)B.tile_word_signed & 0xfc00
+ ((uint)B.npc_xhome << 10)
|
- ((uint)B.tile_word_signed >> 10) & 0x3fU
+ (uint)B.npc_xhome
|
- ((uint)B.tile_word_signed & 0xfc00U) >> 10
+ (uint)B.npc_xhome
|
- (uint)B.tile_word_signed & 0xfc00U
+ ((uint)B.npc_xhome << 10)
)

@promoted_tile_position_tile_y_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.tile_position >> 4) & 0x3f
+ (int)B.tile_y
|
- ((int)B.tile_position & 0x3f0) >> 4
+ (int)B.tile_y
|
- (int)B.tile_position & 0x3f0
+ ((int)B.tile_y << 4)
|
- ((int)B.tile_position >> 4) & 0x3fU
+ (uint)B.tile_y
|
- ((int)B.tile_position & 0x3f0U) >> 4
+ (uint)B.tile_y
|
- (int)B.tile_position & 0x3f0U
+ ((uint)B.tile_y << 4)
|
- ((uint)B.tile_position >> 4) & 0x3f
+ (uint)B.tile_y
|
- ((uint)B.tile_position & 0x3f0) >> 4
+ (uint)B.tile_y
|
- (uint)B.tile_position & 0x3f0
+ ((uint)B.tile_y << 4)
|
- ((uint)B.tile_position >> 4) & 0x3fU
+ (uint)B.tile_y
|
- ((uint)B.tile_position & 0x3f0U) >> 4
+ (uint)B.tile_y
|
- (uint)B.tile_position & 0x3f0U
+ ((uint)B.tile_y << 4)
|
- ((int)B.tile_position_signed >> 4) & 0x3f
+ (int)B.tile_y
|
- ((int)B.tile_position_signed & 0x3f0) >> 4
+ (int)B.tile_y
|
- (int)B.tile_position_signed & 0x3f0
+ ((int)B.tile_y << 4)
|
- ((int)B.tile_position_signed >> 4) & 0x3fU
+ (uint)B.tile_y
|
- ((int)B.tile_position_signed & 0x3f0U) >> 4
+ (uint)B.tile_y
|
- (int)B.tile_position_signed & 0x3f0U
+ ((uint)B.tile_y << 4)
|
- ((uint)B.tile_position_signed >> 4) & 0x3f
+ (uint)B.tile_y
|
- ((uint)B.tile_position_signed & 0x3f0) >> 4
+ (uint)B.tile_y
|
- (uint)B.tile_position_signed & 0x3f0
+ ((uint)B.tile_y << 4)
|
- ((uint)B.tile_position_signed >> 4) & 0x3fU
+ (uint)B.tile_y
|
- ((uint)B.tile_position_signed & 0x3f0U) >> 4
+ (uint)B.tile_y
|
- (uint)B.tile_position_signed & 0x3f0U
+ ((uint)B.tile_y << 4)
)

@promoted_tile_position_tile_x_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.tile_position >> 10) & 0x3f
+ (int)B.tile_x
|
- ((int)B.tile_position & 0xfc00) >> 10
+ (int)B.tile_x
|
- (int)B.tile_position & 0xfc00
+ ((int)B.tile_x << 10)
|
- ((int)B.tile_position >> 10) & 0x3fU
+ (uint)B.tile_x
|
- ((int)B.tile_position & 0xfc00U) >> 10
+ (uint)B.tile_x
|
- (int)B.tile_position & 0xfc00U
+ ((uint)B.tile_x << 10)
|
- ((uint)B.tile_position >> 10) & 0x3f
+ (uint)B.tile_x
|
- ((uint)B.tile_position & 0xfc00) >> 10
+ (uint)B.tile_x
|
- (uint)B.tile_position & 0xfc00
+ ((uint)B.tile_x << 10)
|
- ((uint)B.tile_position >> 10) & 0x3fU
+ (uint)B.tile_x
|
- ((uint)B.tile_position & 0xfc00U) >> 10
+ (uint)B.tile_x
|
- (uint)B.tile_position & 0xfc00U
+ ((uint)B.tile_x << 10)
|
- ((int)B.tile_position_signed >> 10) & 0x3f
+ (int)B.tile_x
|
- ((int)B.tile_position_signed & 0xfc00) >> 10
+ (int)B.tile_x
|
- (int)B.tile_position_signed & 0xfc00
+ ((int)B.tile_x << 10)
|
- ((int)B.tile_position_signed >> 10) & 0x3fU
+ (uint)B.tile_x
|
- ((int)B.tile_position_signed & 0xfc00U) >> 10
+ (uint)B.tile_x
|
- (int)B.tile_position_signed & 0xfc00U
+ ((uint)B.tile_x << 10)
|
- ((uint)B.tile_position_signed >> 10) & 0x3f
+ (uint)B.tile_x
|
- ((uint)B.tile_position_signed & 0xfc00) >> 10
+ (uint)B.tile_x
|
- (uint)B.tile_position_signed & 0xfc00
+ ((uint)B.tile_x << 10)
|
- ((uint)B.tile_position_signed >> 10) & 0x3fU
+ (uint)B.tile_x
|
- ((uint)B.tile_position_signed & 0xfc00U) >> 10
+ (uint)B.tile_x
|
- (uint)B.tile_position_signed & 0xfc00U
+ ((uint)B.tile_x << 10)
)

@promoted_size_weight_collision_radius_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.size_weight >> 0) & 0x7
+ (int)B.collision_radius
|
- ((int)B.size_weight & 0x7) >> 0
+ (int)B.collision_radius
|
- (int)B.size_weight & 0x7
+ (int)B.collision_radius
|
- ((int)B.size_weight >> 0) & 0x7U
+ (uint)B.collision_radius
|
- ((int)B.size_weight & 0x7U) >> 0
+ (uint)B.collision_radius
|
- (int)B.size_weight & 0x7U
+ (uint)B.collision_radius
|
- ((uint)B.size_weight >> 0) & 0x7
+ (uint)B.collision_radius
|
- ((uint)B.size_weight & 0x7) >> 0
+ (uint)B.collision_radius
|
- (uint)B.size_weight & 0x7
+ (uint)B.collision_radius
|
- ((uint)B.size_weight >> 0) & 0x7U
+ (uint)B.collision_radius
|
- ((uint)B.size_weight & 0x7U) >> 0
+ (uint)B.collision_radius
|
- (uint)B.size_weight & 0x7U
+ (uint)B.collision_radius
|
- ((int)B.size_weight_signed >> 0) & 0x7
+ (int)B.collision_radius
|
- ((int)B.size_weight_signed & 0x7) >> 0
+ (int)B.collision_radius
|
- (int)B.size_weight_signed & 0x7
+ (int)B.collision_radius
|
- ((int)B.size_weight_signed >> 0) & 0x7U
+ (uint)B.collision_radius
|
- ((int)B.size_weight_signed & 0x7U) >> 0
+ (uint)B.collision_radius
|
- (int)B.size_weight_signed & 0x7U
+ (uint)B.collision_radius
|
- ((uint)B.size_weight_signed >> 0) & 0x7
+ (uint)B.collision_radius
|
- ((uint)B.size_weight_signed & 0x7) >> 0
+ (uint)B.collision_radius
|
- (uint)B.size_weight_signed & 0x7
+ (uint)B.collision_radius
|
- ((uint)B.size_weight_signed >> 0) & 0x7U
+ (uint)B.collision_radius
|
- ((uint)B.size_weight_signed & 0x7U) >> 0
+ (uint)B.collision_radius
|
- (uint)B.size_weight_signed & 0x7U
+ (uint)B.collision_radius
)

@promoted_size_weight_animated_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.size_weight >> 3) & 0x1
+ (int)B.animated
|
- ((int)B.size_weight & 0x8) >> 3
+ (int)B.animated
|
- (int)B.size_weight & 0x8
+ ((int)B.animated << 3)
|
- ((int)B.size_weight >> 3) & 0x1U
+ (uint)B.animated
|
- ((int)B.size_weight & 0x8U) >> 3
+ (uint)B.animated
|
- (int)B.size_weight & 0x8U
+ ((uint)B.animated << 3)
|
- ((uint)B.size_weight >> 3) & 0x1
+ (uint)B.animated
|
- ((uint)B.size_weight & 0x8) >> 3
+ (uint)B.animated
|
- (uint)B.size_weight & 0x8
+ ((uint)B.animated << 3)
|
- ((uint)B.size_weight >> 3) & 0x1U
+ (uint)B.animated
|
- ((uint)B.size_weight & 0x8U) >> 3
+ (uint)B.animated
|
- (uint)B.size_weight & 0x8U
+ ((uint)B.animated << 3)
|
- ((int)B.size_weight_signed >> 3) & 0x1
+ (int)B.animated
|
- ((int)B.size_weight_signed & 0x8) >> 3
+ (int)B.animated
|
- (int)B.size_weight_signed & 0x8
+ ((int)B.animated << 3)
|
- ((int)B.size_weight_signed >> 3) & 0x1U
+ (uint)B.animated
|
- ((int)B.size_weight_signed & 0x8U) >> 3
+ (uint)B.animated
|
- (int)B.size_weight_signed & 0x8U
+ ((uint)B.animated << 3)
|
- ((uint)B.size_weight_signed >> 3) & 0x1
+ (uint)B.animated
|
- ((uint)B.size_weight_signed & 0x8) >> 3
+ (uint)B.animated
|
- (uint)B.size_weight_signed & 0x8
+ ((uint)B.animated << 3)
|
- ((uint)B.size_weight_signed >> 3) & 0x1U
+ (uint)B.animated
|
- ((uint)B.size_weight_signed & 0x8U) >> 3
+ (uint)B.animated
|
- (uint)B.size_weight_signed & 0x8U
+ ((uint)B.animated << 3)
)

@promoted_size_weight_unit_weight_value disable drop_cast, is_zero, isnt_zero@
expression B;
typedef uint;
@@
(
- ((int)B.size_weight >> 4) & 0xfff
+ (int)B.unit_weight
|
- ((int)B.size_weight & 0xfff0) >> 4
+ (int)B.unit_weight
|
- (int)B.size_weight & 0xfff0
+ ((int)B.unit_weight << 4)
|
- ((int)B.size_weight >> 4) & 0xfffU
+ (uint)B.unit_weight
|
- ((int)B.size_weight & 0xfff0U) >> 4
+ (uint)B.unit_weight
|
- (int)B.size_weight & 0xfff0U
+ ((uint)B.unit_weight << 4)
|
- ((uint)B.size_weight >> 4) & 0xfff
+ (uint)B.unit_weight
|
- ((uint)B.size_weight & 0xfff0) >> 4
+ (uint)B.unit_weight
|
- (uint)B.size_weight & 0xfff0
+ ((uint)B.unit_weight << 4)
|
- ((uint)B.size_weight >> 4) & 0xfffU
+ (uint)B.unit_weight
|
- ((uint)B.size_weight & 0xfff0U) >> 4
+ (uint)B.unit_weight
|
- (uint)B.size_weight & 0xfff0U
+ ((uint)B.unit_weight << 4)
|
- ((int)B.size_weight_signed >> 4) & 0xfff
+ (int)B.unit_weight
|
- ((int)B.size_weight_signed & 0xfff0) >> 4
+ (int)B.unit_weight
|
- (int)B.size_weight_signed & 0xfff0
+ ((int)B.unit_weight << 4)
|
- ((int)B.size_weight_signed >> 4) & 0xfffU
+ (uint)B.unit_weight
|
- ((int)B.size_weight_signed & 0xfff0U) >> 4
+ (uint)B.unit_weight
|
- (int)B.size_weight_signed & 0xfff0U
+ ((uint)B.unit_weight << 4)
|
- ((uint)B.size_weight_signed >> 4) & 0xfff
+ (uint)B.unit_weight
|
- ((uint)B.size_weight_signed & 0xfff0) >> 4
+ (uint)B.unit_weight
|
- (uint)B.size_weight_signed & 0xfff0
+ ((uint)B.unit_weight << 4)
|
- ((uint)B.size_weight_signed >> 4) & 0xfffU
+ (uint)B.unit_weight
|
- ((uint)B.size_weight_signed & 0xfff0U) >> 4
+ (uint)B.unit_weight
|
- (uint)B.size_weight_signed & 0xfff0U
+ ((uint)B.unit_weight << 4)
)
