@object_list_insert_head_definition@
type R;
identifier L, O;
typedef ushort, uw_object_hdr_t;
@@
- R object_list_insert_head(void *L, void *O)
+ R object_list_insert_head(ushort *L, uw_object_hdr_t *O)
 { ... }

@object_list_insert_head_prototype@
type R;
identifier L, O;
typedef ushort, uw_object_hdr_t;
@@
- R object_list_insert_head(void *L, void *O)
+ R object_list_insert_head(ushort *L, uw_object_hdr_t *O)
 ;

@object_list_append_tail_definition@
type R;
identifier L, O;
typedef ushort, uw_object_hdr_t;
@@
- R object_list_append_tail(void *L, void *O)
+ R object_list_append_tail(ushort *L, uw_object_hdr_t *O)
 { ... }

@object_list_append_tail_prototype@
type R;
identifier L, O;
typedef ushort, uw_object_hdr_t;
@@
- R object_list_append_tail(void *L, void *O)
+ R object_list_append_tail(ushort *L, uw_object_hdr_t *O)
 ;

@object_list_unlink_definition@
type R;
identifier L, O;
typedef ushort, uw_object_hdr_t;
@@
- R object_list_unlink(void *L, void *O)
+ R object_list_unlink(ushort *L, uw_object_hdr_t *O)
 { ... }

@object_list_unlink_prototype@
type R;
identifier L, O;
typedef ushort, uw_object_hdr_t;
@@
- R object_list_unlink(void *L, void *O)
+ R object_list_unlink(ushort *L, uw_object_hdr_t *O)
 ;

@unlink_and_free_object_definition@
type R;
identifier L, O;
typedef ushort, uw_object_hdr_t;
@@
- R unlink_and_free_object(void *L, void *O)
+ R unlink_and_free_object(ushort *L, uw_object_hdr_t *O)
 { ... }

@unlink_and_free_object_prototype@
type R;
identifier L, O;
typedef ushort, uw_object_hdr_t;
@@
- R unlink_and_free_object(void *L, void *O)
+ R unlink_and_free_object(ushort *L, uw_object_hdr_t *O)
 ;

@free_linked_object_recursive_definition@
type R;
identifier P;
typedef ushort, uw_object_hdr_t;
@@
- R free_linked_object_recursive(void *P)
+ R free_linked_object_recursive(ushort *P)
 { ... }

@free_linked_object_recursive_prototype@
type R;
identifier P;
typedef ushort, uw_object_hdr_t;
@@
- R free_linked_object_recursive(void *P)
+ R free_linked_object_recursive(ushort *P)
 ;

@free_object_slot_definition@
type R;
identifier P;
typedef ushort, uw_object_hdr_t;
@@
- R free_object_slot(void *P)
+ R free_object_slot(uw_object_hdr_t *P)
 { ... }

@free_object_slot_prototype@
type R;
identifier P;
typedef ushort, uw_object_hdr_t;
@@
- R free_object_slot(void *P)
+ R free_object_slot(uw_object_hdr_t *P)
 ;

@encode_object_slot_index_definition@
type R;
identifier P;
typedef ushort, uw_object_hdr_t;
@@
- R encode_object_slot_index(void *P)
+ R encode_object_slot_index(const uw_object_hdr_t *P)
 { ... }

@encode_object_slot_index_prototype@
type R;
identifier P;
typedef ushort, uw_object_hdr_t;
@@
- R encode_object_slot_index(void *P)
+ R encode_object_slot_index(const uw_object_hdr_t *P)
 ;

@object_is_mobile_definition@
type R;
identifier P;
typedef ushort, uw_object_hdr_t;
@@
- R object_is_mobile(void *P)
+ R object_is_mobile(const uw_object_hdr_t *P)
 { ... }

@object_is_mobile_prototype@
type R;
identifier P;
typedef ushort, uw_object_hdr_t;
@@
- R object_is_mobile(void *P)
+ R object_is_mobile(const uw_object_hdr_t *P)
 ;
