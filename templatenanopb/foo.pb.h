/* Automatically generated nanopb header */
/* Generated by nanopb-0.4.2 */

#ifndef PB_TEMPLATE_FOO_PB_H_INCLUDED
#define PB_TEMPLATE_FOO_PB_H_INCLUDED
#include <pb.h>

#if PB_PROTO_HEADER_VERSION != 40
#error Regenerate this file with the current version of nanopb generator.
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Struct definitions */
typedef struct _template_Foo {
    pb_size_t which_bar;
    union {
        pb_callback_t a;
        int32_t b;
    } bar;
} template_Foo;


/* Initializer values for message structs */
#define template_Foo_init_default                {0, {{{NULL}, NULL}}}
#define template_Foo_init_zero                   {0, {{{NULL}, NULL}}}

/* Field tags (for use in manual encoding/decoding) */
#define template_Foo_a_tag                       1
#define template_Foo_b_tag                       2

/* Struct field encoding specification for nanopb */
#define template_Foo_FIELDLIST(X, a) \
X(a, CALLBACK, ONEOF,    STRING,   (bar,a,bar.a),     1) \
X(a, STATIC,   ONEOF,    INT32,    (bar,b,bar.b),     2)
#define template_Foo_CALLBACK pb_default_field_callback
#define template_Foo_DEFAULT NULL

extern const pb_msgdesc_t template_Foo_msg;

/* Defines for backwards compatibility with code written before nanopb-0.4.0 */
#define template_Foo_fields &template_Foo_msg

/* Maximum encoded size of messages (where known) */
/* template_Foo_size depends on runtime parameters */

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif