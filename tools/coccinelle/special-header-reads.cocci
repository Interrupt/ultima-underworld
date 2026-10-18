@special_header_ptr_0 disable drop_cast, is_zero, isnt_zero@
expression B;
typedef ushort;
@@
- (short)(B->type_flags_signed & -0x8000) == 0
+ B->is_quant == 0

@special_header_ptr_1 disable drop_cast, is_zero, isnt_zero@
expression B;
typedef ushort;
@@
- (B->link_word_signed & 0x8000U) != 0
+ B->link >= 512

@special_header_ptr_2 disable drop_cast, is_zero, isnt_zero@
expression B;
typedef ushort;
@@
- (ushort)B->link_word_signed >> 6
+ (int)B->link

@special_header_value_0 disable drop_cast, is_zero, isnt_zero@
expression B;
typedef ushort;
@@
- (short)(B.type_flags_signed & -0x8000) == 0
+ B.is_quant == 0

@special_header_value_1 disable drop_cast, is_zero, isnt_zero@
expression B;
typedef ushort;
@@
- (B.link_word_signed & 0x8000U) != 0
+ B.link >= 512

@special_header_value_2 disable drop_cast, is_zero, isnt_zero@
expression B;
typedef ushort;
@@
- (ushort)B.link_word_signed >> 6
+ (int)B.link
