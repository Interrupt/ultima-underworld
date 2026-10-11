#ifndef UW_H
#define UW_H

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <strings.h>
#include <stdlib.h>
#include "ghidra_intrinsics.h"
#include "ordinal_stubs.h"
#include "gx_stub.h"
#include "file_io.h"

typedef unsigned char   undefined;

typedef unsigned char    byte;
typedef unsigned int    dword;
typedef unsigned int    uint;
typedef unsigned short   ushort;
typedef unsigned long long undefined8;
typedef unsigned int    uint3;
typedef unsigned int    undefined3;
typedef unsigned int    int3;
typedef unsigned long long ulonglong;
typedef long long       longlong;
typedef void            *pointer32;
typedef pointer32 ImageBaseOffset32;

typedef unsigned long    ulong;
typedef unsigned char    undefined1;
typedef unsigned short    undefined2;
typedef unsigned int    undefined4;
typedef unsigned short    word;
#define unkbyte9   unsigned long long
#define unkbyte10   unsigned long long
#define unkbyte11   unsigned long long
#define unkbyte12   unsigned long long
#define unkbyte13   unsigned long long
#define unkbyte14   unsigned long long
#define unkbyte15   unsigned long long
#define unkbyte16   unsigned long long

#define unkuint9   unsigned long long
#define unkuint10   unsigned long long
#define unkuint11   unsigned long long
#define unkuint12   unsigned long long
#define unkuint13   unsigned long long
#define unkuint14   unsigned long long
#define unkuint15   unsigned long long
#define unkuint16   unsigned long long

#define unkint9   long long
#define unkint10   long long
#define unkint11   long long
#define unkint12   long long
#define unkint13   long long
#define unkint14   long long
#define unkint15   long long
#define unkint16   long long

#define unkfloat1   float
#define unkfloat2   float
#define unkfloat3   float
#define unkfloat5   double
#define unkfloat6   double
#define unkfloat7   double
#define unkfloat9   long double
#define unkfloat11   long double
#define unkfloat12   long double
#define unkfloat13   long double
#define unkfloat14   long double
#define unkfloat15   long double
#define unkfloat16   long double

#define BADSPACEBASE   void
/* Ghidra's pseudo-type for "executable code" reached through a function pointer. */
typedef void code();
/* Same idea as 'code', but for call-through-pointer sites whose result is
 * actually used as a value (Ghidra's jump tables mix void and value-
 * returning targets under the same 'code' label). */
typedef undefined4 codeval();
/* Same idea as 'codeval', but for call-through-pointer sites whose result is a real pointer (e.g.
   an allocator callback) rather than a 4-byte scalar -- returning through 'codeval' truncates the
   pointer on 64-bit hosts. */
typedef void *codeptr();


/* Object / tile record structs. This WinCE port keeps the exact same bit-packed layout LEV.ARK uses
   on disk for its object table and tilemap, in memory, at runtime -- not just at load time. */
/* Word unions expose named byte views for legacy partial writes. These
 * alias the same little-endian storage; they add no bytes to disk records.
 * Prefer semantic bitfields or whole-word assignments when possible. */
typedef struct __attribute__((packed)) {
    /* word 0x00 */
    union {
        ushort type_flags;
        short type_flags_signed;
        struct __attribute__((packed)) { byte type_flags_low, type_flags_high; }; /* packed word for copies and chain interfaces */
        struct __attribute__((packed)) {
            unsigned short object_id  : 9;  /* object id / type, 0-0x1ff */
            unsigned short flags_res  : 3;  /* bits 9-11: unused/unknown per wiki */
            unsigned short enchanted  : 1;  /* bit 12 */
            unsigned short doordir    : 1;  /* bit 13: door swing direction (doors only) */
            unsigned short invisible  : 1;  /* bit 14 */
            unsigned short is_quant   : 1;  /* bit 15: word3's low field is a quantity, not owner/special */
        };
    };

    /* word 0x02 */
    union {
        ushort position_word;
        short position_word_signed;
        struct __attribute__((packed)) { byte position_word_low, position_word_high; }; /* packed word for copies and chain interfaces */
        struct __attribute__((packed)) {
            unsigned short zpos       : 7;  /* bits 0-6: object Z position, 0-127 */
            unsigned short heading    : 3;  /* bits 7-9: heading, *45 degrees */
            unsigned short ypos       : 3;  /* bits 10-12: sub-tile Y, 0-7 */
            unsigned short xpos       : 3;  /* bits 13-15: sub-tile X, 0-7 */
        };
    };

    /* word 0x04 */
    union {
        ushort chain_word;
        short chain_word_signed;
        struct __attribute__((packed)) { byte chain_word_low, chain_word_high; }; /* packed word for copies and chain interfaces */
        struct __attribute__((packed)) {
            unsigned short quality    : 6;  /* bits 0-5 */
            unsigned short next       : 10; /* bits 6-15: next object slot index in this tile's/container's chain */
        };
    };

    /* word 0x06 */
    union {
        ushort link_word;
        short link_word_signed;
        struct __attribute__((packed)) { byte link_word_low, link_word_high; };          /* addressable packed link for chain primitives */
        struct __attribute__((packed)) {
            unsigned short owner : 6; /* bits 0-5: owner / special property */
            unsigned short link : 10; /* bits 6-15: quantity / link / contents */
        };
    };
} uw_object_hdr_t;

typedef struct __attribute__((packed)) {
    uw_object_hdr_t hdr;            /* 8 bytes, offset 0x00 */

    union {
        byte npc_hp;               /* offset 0x08: NPC health */
        byte hit_points;           /* shared mobile snapshot health/lifetime byte */
    };
    unsigned char  full_heading;    /* offset 0x09: 256-direction motion heading */
    union {
        byte movement_flags;       /* offset 0x0a: motion/refresh state */
        struct __attribute__((packed)) {
            byte tick_phase : 4;   /* modulo-16 schedule; tick_mobile_objects/npc_ai_tick */
            byte movement_mode : 3; /* bits 4-6: placement collision-state code */
            byte _movement_bit7 : 1;
        };
    };

    union {
        ushort goal_word;
        short goal_word_signed;
        struct __attribute__((packed)) { byte goal_word_low, goal_word_high; };
        struct __attribute__((packed)) {
            unsigned short npc_goal    : 4; /* offset 0x0b, bits 0-3 */
            unsigned short npc_gtarg   : 8; /* bits 4-11 */
            unsigned short npc_animation_frame : 4; /* bits 12-15 */
        };
    };

    union {
        ushort status_word;
        short status_word_signed;
        struct __attribute__((packed)) { byte status_word_low, status_word_high; };
        struct __attribute__((packed)) {
            unsigned short npc_level    : 4; /* offset 0x0d, bits 0-3 */
            unsigned short _pad0d       : 8; /* bits 4-11: not in the wiki's own table */
            unsigned short npc_loot_spawned : 1; /* bit 12: death loot already spawned (byte 0xe & 0x10) */
            unsigned short npc_talkedto : 1; /* bit 13 */
            unsigned short npc_attitude : 2; /* bits 14-15 */
        };
    };

    /* npc_set_walk_target confirms two SIX-bit coordinates. The old
     * wiki's tentative seven-bit "npc_height" overlaps the swing field. */
    union {
        ushort target_word;
        short target_word_signed;
        struct __attribute__((packed)) { byte target_word_low, target_word_high; };
        struct __attribute__((packed)) {
            unsigned short npc_target_tile_x : 6; /* offset 0x0f, bits 0-5 */
            unsigned short npc_target_tile_y : 6; /* bits 6-11 */
            unsigned short npc_swing_charge : 4;  /* bits 12-15 */
        };
    };

    byte recent_damage;           /* 0x11: damage accumulated during this tick */
    byte damage_source;           /* 0x12: last attacker / projectile source slot */
    union {
        byte motion_flags;        /* 0x13: speed and vertical-motion control */
        struct __attribute__((packed)) {
            byte speed : 7;
            byte gravity_flag : 1;
        };
    };
    union {
        byte attack_pitch;        /* 0x14: NPC attack state / shared placement pitch */
        struct __attribute__((packed)) {
            byte _attack_pitch_lo : 3;
            byte pitch : 5;       /* placement vertical offset: (pitch - 16) * 64 */
        };
    };
    byte animation_flags;         /* 0x15: animation and path state */

    union {
        ushort tile_word;
        ushort tile_position;     /* shared mobile tile coordinates */
        short tile_word_signed;
        short tile_position_signed;
        struct __attribute__((packed)) { byte tile_word_low, tile_word_high; };
        struct __attribute__((packed)) { byte tile_position_low, tile_position_high; };
        struct __attribute__((packed)) {
            ushort _tile_position_lo : 4;
            ushort tile_y : 6;
            ushort tile_x : 6;
        };
        struct __attribute__((packed)) {
            unsigned short npc_path_slot : 4; /* offset 0x16: cached walk-path slot */
            unsigned short npc_yhome  : 6;  /* bits 4-9 */
            unsigned short npc_xhome  : 6;  /* bits 10-15 */
        };
    };

    union {
        byte heading_flags;       /* 0x18: includes NPC path flags in bits 5-7 */
        struct __attribute__((packed)) {
            byte npc_heading : 5;
            byte _pad18 : 3;
        };
        struct __attribute__((packed)) {
            byte fine_heading : 5; /* shared low five bits of full placement heading */
            byte _heading_bits_hi : 3;
        };
    };
    union {
        byte npc_ai_flags;        /* 0x19: notice, attack and allegiance flags */
        struct __attribute__((packed)) {
            byte npc_ai_flags_low7 : 7; /* low seven AI flag bits; individual meanings remain under review */
            byte _pad19 : 1;
        };
    };
    unsigned char  npc_whoami;      /* offset 0x1a, full byte */
} uw_mobile_object_t;  /* 0x1b (27) bytes total */

/* UW1 uses the same 27-byte arena slot for thrown items and missiles.
 * Their coordinates overlap NPC goal/level/target fields. Do not interpret
 * those words as NPC fields when the slot contains a projectile.
 * Reference: UWReverseEngineering/File Research/Game Object Research File.xlsx,
 * "Object" sheet; corroborated by build_object_placement_snapshot in ai.c. */
typedef struct __attribute__((packed)) {
    uw_object_hdr_t hdr;           /* 0x00 */
    byte lifetime;                /* 0x08: projectile hit points / lifetime */
    byte heading;                 /* 0x09: full 256-direction launch heading */
    byte movement_flags;          /* 0x0a: motion/tile state */
    ushort precise_x;             /* 0x0b: world position, copied into snapshot */
    ushort precise_y;             /* 0x0d */
    ushort precise_z;             /* 0x0f */
    byte _reserved11;
    byte source_slot;             /* 0x12: launcher's mobile slot */
    byte speed : 7;               /* 0x13: placement snapshot speed */
    byte gravity_flag : 1;        /* selects vertical acceleration in snapshot */
    union {
        byte pitch_flags;         /* 0x14: low motion bits and five-bit launch pitch */
        struct __attribute__((packed)) {
            byte _reserved14_lo : 3;
            byte pitch : 5;       /* 16 = horizontal, interpreted as (pitch-16)*64 */
        };
    };
    byte animation_flags;         /* 0x15 */
    union {
        ushort tile_position;    /* 0x16: packed coordinates, including reserved bits */
        struct __attribute__((packed)) {
            ushort _reserved16_lo : 4;
            ushort tile_y : 6;
            ushort tile_x : 6;
        };
    };
    byte fine_heading : 5;        /* 0x18 */
    byte _reserved18_hi : 3;
    byte _reserved19;
    byte original_heading;        /* 0x1a: restored when the item becomes static */
} uw_projectile_object_t;

/* UW1 OBJECTS.DAT container, light and animation records. The container
 * acceptance word is documented by objects_dat-containers.xls and read
 * as a signed short by the ARM inventory code (0xffff accepts anything).
 * Light byte order follows ARM consumers and the shipped UW1 data:
 * byte 0 is the decay interval, byte 1 is brightness. */
typedef struct __attribute__((packed)) {
    byte capacity;                 /* units of 0.1 stones, zero unlimited */
    ushort acceptance_mask;        /* item ID or category selector */
} uw_container_type_props_t;

typedef struct __attribute__((packed)) {
    byte decay_interval;           /* ticks per quality decrement; zero infinite */
    byte brightness;
} uw_light_type_props_t;

typedef struct __attribute__((packed)) {
    ushort flags;                  /* sprite/door animation behavior bits */
    byte start_frame;
    byte frame_count;
} uw_animation_type_props_t;

_Static_assert(sizeof(uw_container_type_props_t) == 3, "UW1 container property row");
_Static_assert(sizeof(uw_light_type_props_t) == 2, "UW1 light property row");
_Static_assert(sizeof(uw_animation_type_props_t) == 4, "UW1 animation property row");

/* UW1 OBJECTS.DAT melee and wearable rows at disk offsets 0x02 and
 * 0xb2. The ARM loader copies both without changing the disk layout.
 * Charge-byte interpretations remain tentative in object_dat-melee.xls. */
typedef struct __attribute__((packed)) {
    byte slash_damage;
    byte bash_damage;
    byte stab_damage;
    byte minimum_charge;
    byte charge_speed;
    byte maximum_charge;
    byte skill;
    byte durability;
} uw_melee_type_props_t;

typedef struct __attribute__((packed)) {
    byte protection;
    byte durability;
    byte _unknown02;
    byte equipment_slot;
} uw_armor_type_props_t;

_Static_assert(sizeof(uw_melee_type_props_t) == 8, "UW1 melee property row");
_Static_assert(sizeof(uw_armor_type_props_t) == 4, "UW1 armor property row");

/* UW1 OBJECTS.DAT ranged records: 16 rows at file offset 0x82.
 * File Research/objects_dat-ranged.xls and the ARM consumers agree:
 * selector is an ammo subtype for weapons and a negated damage type
 * for projectiles, rather than the DOS documentation's durability. */
typedef struct __attribute__((packed)) {
    byte damage;
    byte projectile_speed;
    byte ammo_damage_selector;
} uw_ranged_type_props_t;

_Static_assert(sizeof(uw_ranged_type_props_t) == 3, "UW1 ranged property row");

/* UW1 OBJECTS.DAT, 64 critter records at file offset 0x132. Unlike
 * COMOBJ, ARM loads these 48-byte disk rows without adding padding.
 * Field meanings: File Research/objects_dat-critters.xls; attack score,
 * damage and probability order is also confirmed by combat.c. */
typedef struct __attribute__((packed)) {
    byte skill;
    byte damage;
    byte probability;
} uw_monster_attack_props_t;

typedef struct __attribute__((packed)) {
    byte armor[4];                 /* 0x00: chest, arms, legs, head */
    byte max_hp;                   /* 0x04 */
    byte strength;                 /* 0x05 */
    byte dexterity;                /* 0x06 */
    byte intelligence;             /* 0x07 */
    byte effects_flags;            /* 0x08: blood, fluid/remains and death sound */
    byte race_flags;               /* 0x09 */
    byte movement_flags;           /* 0x0a: passivity, swimming, flight, corpse */
    byte magic_power;              /* 0x0b */
    byte movement_speed;           /* 0x0c */
    byte trade_level;              /* 0x0d: appraisal and conversation level */
    byte trade_patience;           /* 0x0e */
    byte poison_damage;            /* 0x0f */
    byte category;                 /* 0x10 */
    byte equipment_damage;         /* 0x11 */
    byte defense;                  /* 0x12 */
    uw_monster_attack_props_t attacks[3]; /* 0x13..0x1b */
    byte morale_flags;             /* 0x1c */
    byte detection_ranges;         /* 0x1d */
    byte awareness_ranges;         /* 0x1e */
    byte missile_wander_flags;     /* 0x1f */
    byte weapon_loot[2];           /* 0x20 */
    ushort item_loot[2];           /* 0x22 */
    byte coin_loot;                /* 0x26 */
    byte food_loot;                /* 0x27 */
    ushort experience;             /* 0x28 */
    byte spells[3];                /* 0x2a: 0xff means no spell */
    byte spell_flags;              /* 0x2d */
    byte door_skill;               /* 0x2e */
    byte _unknown2f;
} uw_monster_type_props_t;

_Static_assert(sizeof(uw_monster_type_props_t) == 48, "UW1 critter property row");
_Static_assert(sizeof(uw_object_hdr_t) == 8, "UW1 object header layout");
_Static_assert(sizeof(uw_mobile_object_t) == 27, "UW1 mobile slot layout");
_Static_assert(sizeof(uw_projectile_object_t) == 27, "UW1 projectile slot layout");

/* 4-byte level tilemap record (wiki section 4.2). DAT_002029cc is the level's flat 64x64 array of
   these (tilemap_lookup, uw.c ~58433, is the single shared accessor behind 70+ call sites: index =
   tileX + tileY*0x40). */
typedef struct __attribute__((packed)) {
    /* word 0x00 */
    unsigned short tile_type    : 4;  /* bits 0-3: 0-9 */
    unsigned short floor_height : 4;  /* bits 4-7 */
    unsigned short unk_light    : 1;  /* bit 8: possible special-light flag per wiki */
    unsigned short unused9      : 1;  /* bit 9: never used in uw1 per wiki */
    unsigned short floor_tex    : 4;  /* bits 10-13 */
    unsigned short no_magic     : 1;  /* bit 14: magic disallowed flag */
    unsigned short door_bit     : 1;  /* bit 15 */

    /* word 0x02 */
    unsigned short wall_tex     : 6;  /* bits 0-5 */
    unsigned short obj_head     : 10; /* bits 6-15: first object slot index on this tile */
} uw_tile_t;  /* 4 bytes total */

/* UW1 COMOBJ.DAT: 11 bytes on disk, expanded by the ARM loader to 13
 * bytes in memory. Disk bytes 4..10 become native bytes 5..11. */
typedef struct __attribute__((packed)) {
    byte height;                 /* 0x00: collision height in packed Z units */
    union {
        ushort size_weight;
        short size_weight_signed;
        struct __attribute__((packed)) { byte size_weight_low, size_weight_high; };      /* 0x01: full packed radius/mass word */
        struct __attribute__((packed)) {
            ushort collision_radius : 3;
            ushort animated : 1;
            ushort unit_weight : 12; /* tenths of a stone */
        };
    };
    byte flags;                  /* 0x03: model, magic, pickup and container flags */
    byte _pad04;                 /* native alignment gap, not a COMOBJ.DAT byte */
    ushort monetary_value;       /* 0x05: disk offset 4 */
    union {
        ushort quality_owner_flags; /* word spanning the two disk flag bytes */
        struct __attribute__((packed)) {
            byte quality_flags;  /* 0x07: disk offset 6 */
            union {
                byte owner_flags; /* 0x08: disk offset 7 */
                struct __attribute__((packed)) {
                    byte _owner_low : 7;
                    byte can_have_owner : 1;
                };
            };
        };
    };
    byte scale_flags;            /* 0x09: disk offset 8; resistance tests use its bits */
    byte class_flags;            /* 0x0a: disk offset 9; combine/settle classification */
    union {
        byte description_flags;  /* 0x0b: disk offset 10 */
        struct __attribute__((packed)) {
            byte quality_type : 4;
            byte has_look_description : 1;
            byte _description_high : 3;
        };
    };
    byte _pad0c;                 /* native alignment gap, not a COMOBJ.DAT byte */
} uw_object_type_props_t;  /* 0xd (13) bytes total */

/* ~0x2e-byte "current view" scratch record: the screen-space eye/ camera transform (world
   x/y/elevation, facing, and a camera-shake offset pair), written once per frame by
   update_current_view_from_subject from the live player state -- or... */
// was FUN_00069470
typedef struct __attribute__((packed)) {
    unsigned char _unk00_09[10];   /* 0x00-0x09: unconfirmed */
    short view_x;                  /* 0x0a: world X */
    unsigned char _unk0c_0d[2];    /* 0x0c-0x0d: unconfirmed */
    short view_elevation;          /* 0x0e: world Z / eye height (clamped <=1000 in update_current_view_from_subject) */
    unsigned char _unk10_11[2];    /* 0x10-0x11: unconfirmed */
    short view_y;                  /* 0x12: world Y */
    unsigned char _unk14_27[0x14]; /* 0x14-0x27: unconfirmed */
    short view_shake_x;            /* 0x28: camera-shake/bob X accumulator */
    short view_shake_y;            /* 0x2a: camera-shake/bob Y accumulator */
    short view_facing;             /* 0x2c: heading */
} uw_current_view_t;  /* 0x2e (46) bytes total (of the 64-byte backing allocation) */

typedef union IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion, *PIMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion;

typedef struct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct, *PIMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct;

struct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct {
    dword OffsetToDirectory:31;
    dword DataIsDirectory:1;
};

union IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion {
    dword OffsetToData;
    struct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct;
};

typedef unsigned short    wchar16;
typedef struct IMAGE_DOS_HEADER IMAGE_DOS_HEADER, *PIMAGE_DOS_HEADER;

struct IMAGE_DOS_HEADER {
    char e_magic[2]; // Magic number
    word e_cblp; // Bytes of last page
    word e_cp; // Pages in file
    word e_crlc; // Relocations
    word e_cparhdr; // Size of header in paragraphs
    word e_minalloc; // Minimum extra paragraphs needed
    word e_maxalloc; // Maximum extra paragraphs needed
    word e_ss; // Initial (relative) SS value
    word e_sp; // Initial SP value
    word e_csum; // Checksum
    word e_ip; // Initial IP value
    word e_cs; // Initial (relative) CS value
    word e_lfarlc; // File address of relocation table
    word e_ovno; // Overlay number
    word e_res[4][4]; // Reserved words
    word e_oemid; // OEM identifier (for e_oeminfo)
    word e_oeminfo; // OEM information; e_oemid specific
    word e_res2[10][10]; // Reserved words
    dword e_lfanew; // File address of new exe header
    byte e_program[64]; // Actual DOS program
};

typedef struct HWND__ HWND__, *PHWND__;

struct HWND__ { // PlaceHolder Structure
};

typedef struct GXKeyList GXKeyList, *PGXKeyList;

struct GXKeyList { // PlaceHolder Structure
};

typedef struct GXDisplayProperties GXDisplayProperties, *PGXDisplayProperties;

struct GXDisplayProperties { // PlaceHolder Structure
};

typedef struct IMAGE_OPTIONAL_HEADER32 IMAGE_OPTIONAL_HEADER32, *PIMAGE_OPTIONAL_HEADER32;

typedef struct IMAGE_DATA_DIRECTORY IMAGE_DATA_DIRECTORY, *PIMAGE_DATA_DIRECTORY;

struct IMAGE_DATA_DIRECTORY {
    ImageBaseOffset32 VirtualAddress;
    dword Size;
};

struct IMAGE_OPTIONAL_HEADER32 {
    word Magic;
    byte MajorLinkerVersion;
    byte MinorLinkerVersion;
    dword SizeOfCode;
    dword SizeOfInitializedData;
    dword SizeOfUninitializedData;
    ImageBaseOffset32 AddressOfEntryPoint;
    ImageBaseOffset32 BaseOfCode;
    ImageBaseOffset32 BaseOfData;
    pointer32 ImageBase;
    dword SectionAlignment;
    dword FileAlignment;
    word MajorOperatingSystemVersion;
    word MinorOperatingSystemVersion;
    word MajorImageVersion;
    word MinorImageVersion;
    word MajorSubsystemVersion;
    word MinorSubsystemVersion;
    dword Win32VersionValue;
    dword SizeOfImage;
    dword SizeOfHeaders;
    dword CheckSum;
    word Subsystem;
    word DllCharacteristics;
    dword SizeOfStackReserve;
    dword SizeOfStackCommit;
    dword SizeOfHeapReserve;
    dword SizeOfHeapCommit;
    dword LoaderFlags;
    dword NumberOfRvaAndSizes;
    struct IMAGE_DATA_DIRECTORY DataDirectory[16];
};

typedef struct _IMAGE_RUNTIME_FUNCTION_ENTRY _IMAGE_RUNTIME_FUNCTION_ENTRY, *P_IMAGE_RUNTIME_FUNCTION_ENTRY;

struct _IMAGE_RUNTIME_FUNCTION_ENTRY {
    ImageBaseOffset32 BeginAddress;
    ImageBaseOffset32 ExceptionInfo;
};

typedef struct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct, *PIMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct;

struct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct {
    dword NameOffset:31;
    dword NameIsString:1;
};

typedef struct _IMAGE_RUNTIME_FUNCTION_ENTRY_2 _IMAGE_RUNTIME_FUNCTION_ENTRY_2, *P_IMAGE_RUNTIME_FUNCTION_ENTRY_2;

struct _IMAGE_RUNTIME_FUNCTION_ENTRY_2 {
    ImageBaseOffset32 BeginAddress;
    dword Flag:2;
    dword FunctionLength:11;
    dword Ret:2;
    dword H:1;
    dword Reg:3;
    dword R:1;
    dword L:1;
    dword C:1;
    dword StackAdjust:10;
};

typedef struct IMAGE_FILE_HEADER IMAGE_FILE_HEADER, *PIMAGE_FILE_HEADER;

struct IMAGE_FILE_HEADER {
    word Machine; // 448
    word NumberOfSections;
    dword TimeDateStamp;
    dword PointerToSymbolTable;
    dword NumberOfSymbols;
    word SizeOfOptionalHeader;
    word Characteristics;
};

typedef struct IMAGE_NT_HEADERS32 IMAGE_NT_HEADERS32, *PIMAGE_NT_HEADERS32;

struct IMAGE_NT_HEADERS32 {
    char Signature[4];
    struct IMAGE_FILE_HEADER FileHeader;
    struct IMAGE_OPTIONAL_HEADER32 OptionalHeader;
};

typedef struct IMAGE_RESOURCE_DIRECTORY_ENTRY IMAGE_RESOURCE_DIRECTORY_ENTRY, *PIMAGE_RESOURCE_DIRECTORY_ENTRY;

typedef union IMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion IMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion, *PIMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion;

union IMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion {
    struct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct;
    dword Name;
    word Id;
};

struct IMAGE_RESOURCE_DIRECTORY_ENTRY {
    union IMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion NameUnion;
    union IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion DirectoryUnion;
};

typedef struct IMAGE_SECTION_HEADER IMAGE_SECTION_HEADER, *PIMAGE_SECTION_HEADER;

typedef union Misc Misc, *PMisc;

typedef enum SectionFlags {
    IMAGE_SCN_TYPE_NO_PAD=8,
    IMAGE_SCN_RESERVED_0001=16,
    IMAGE_SCN_CNT_CODE=32,
    IMAGE_SCN_CNT_INITIALIZED_DATA=64,
    IMAGE_SCN_CNT_UNINITIALIZED_DATA=128,
    IMAGE_SCN_LNK_OTHER=256,
    IMAGE_SCN_LNK_INFO=512,
    IMAGE_SCN_RESERVED_0040=1024,
    IMAGE_SCN_LNK_REMOVE=2048,
    IMAGE_SCN_LNK_COMDAT=4096,
    IMAGE_SCN_GPREL=32768,
    IMAGE_SCN_MEM_16BIT=131072,
    IMAGE_SCN_MEM_PURGEABLE=131072,
    IMAGE_SCN_MEM_LOCKED=262144,
    IMAGE_SCN_MEM_PRELOAD=524288,
    IMAGE_SCN_ALIGN_1BYTES=1048576,
    IMAGE_SCN_ALIGN_2BYTES=2097152,
    IMAGE_SCN_ALIGN_4BYTES=3145728,
    IMAGE_SCN_ALIGN_8BYTES=4194304,
    IMAGE_SCN_ALIGN_16BYTES=5242880,
    IMAGE_SCN_ALIGN_32BYTES=6291456,
    IMAGE_SCN_ALIGN_64BYTES=7340032,
    IMAGE_SCN_ALIGN_128BYTES=8388608,
    IMAGE_SCN_ALIGN_256BYTES=9437184,
    IMAGE_SCN_ALIGN_512BYTES=10485760,
    IMAGE_SCN_ALIGN_1024BYTES=11534336,
    IMAGE_SCN_ALIGN_2048BYTES=12582912,
    IMAGE_SCN_ALIGN_4096BYTES=13631488,
    IMAGE_SCN_ALIGN_8192BYTES=14680064,
    IMAGE_SCN_LNK_NRELOC_OVFL=16777216,
    IMAGE_SCN_MEM_DISCARDABLE=33554432,
    IMAGE_SCN_MEM_NOT_CACHED=67108864,
    IMAGE_SCN_MEM_NOT_PAGED=134217728,
    IMAGE_SCN_MEM_SHARED=268435456,
    IMAGE_SCN_MEM_EXECUTE=536870912,
    IMAGE_SCN_MEM_READ=1073741824,
    IMAGE_SCN_MEM_WRITE=2147483648
} SectionFlags;

union Misc {
    dword PhysicalAddress;
    dword VirtualSize;
};

struct IMAGE_SECTION_HEADER {
    char Name[8];
    union Misc Misc;
    ImageBaseOffset32 VirtualAddress;
    dword SizeOfRawData;
    dword PointerToRawData;
    dword PointerToRelocations;
    dword PointerToLinenumbers;
    word NumberOfRelocations;
    word NumberOfLinenumbers;
    enum SectionFlags Characteristics;
};

typedef struct IMAGE_RESOURCE_DIR_STRING_U_8 IMAGE_RESOURCE_DIR_STRING_U_8, *PIMAGE_RESOURCE_DIR_STRING_U_8;

struct IMAGE_RESOURCE_DIR_STRING_U_8 {
    word Length;
    wchar16 NameString[4];
};

typedef struct IMAGE_RESOURCE_DATA_ENTRY IMAGE_RESOURCE_DATA_ENTRY, *PIMAGE_RESOURCE_DATA_ENTRY;

struct IMAGE_RESOURCE_DATA_ENTRY {
    dword OffsetToData;
    dword Size;
    dword CodePage;
    dword Reserved;
};

typedef struct IMAGE_RESOURCE_DIRECTORY IMAGE_RESOURCE_DIRECTORY, *PIMAGE_RESOURCE_DIRECTORY;

struct IMAGE_RESOURCE_DIRECTORY {
    dword Characteristics;
    dword TimeDateStamp;
    word MajorVersion;
    word MinorVersion;
    word NumberOfNamedEntries;
    word NumberOfIdEntries;
};


void emit_object_billboard();


#define ordint_divmod_exref ((void*)&ordint_divmod)

/* Declarations for the functions and owned globals that used to live directly in this file but were
   split out into their own topic .c files this session... */
#include "helpers.h"
#include "graphics.h"
#include "options.h"
#include "babl.h"
#include "automap.h"
#include "inventory.h"
#include "combat.h"
#include "bitmap.h"
#include "3d.h"
#include "lights.h"
#include "player.h"
#include "tmap.h"
#include "objects.h"
#include "hud.h"
#include "debug_shim.h"
#include "ai.h"
#include "containers.h"
#include "interact.h"
#include "resources.h"
#include "item_use.h"
#include "movement.h"
#include "visibility.h"
#include "saveload.h"
#include "text.h"
#include "collision.h"
#include "input.h"
#include "object_actions.h"
#include "weapon_swing.h"
#include "level.h"
#include "doors.h"
#include "winfile_wrappers.h"
#include "models.h"
#include "math.h"
#include "game.h"
#include "chargen.h"
#include "audio.h"
#include "registration.h"
#include "scheduler.h"
#include "traps.h"
#include "main.h"
#include "demomode.h"

/* .E model-parser globals (g_model_known_ext_colors/g_model_parse_point_count/
   g_model_parse_part_count and ~190 bare-literal-address DAT_xxx/string constants)... */

#endif /* UW_H */
