# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: bar.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='bar.proto',
  package='template',
  syntax='proto3',
  serialized_options=b'Z%arhat.dev/template-proto/templategopb',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\tbar.proto\x12\x08template\"6\n\x03\x42\x61r\x12\x1a\n\x01\x62\x18\x01 \x01(\x0e\x32\x0f.template.Bar.B\"\x13\n\x01\x42\x12\x06\n\x02\x45\x31\x10\x00\x12\x06\n\x02\x45\x32\x10\x01\x42\'Z%arhat.dev/template-proto/templategopbb\x06proto3'
)



_BAR_B = _descriptor.EnumDescriptor(
  name='B',
  full_name='template.Bar.B',
  filename=None,
  file=DESCRIPTOR,
  create_key=_descriptor._internal_create_key,
  values=[
    _descriptor.EnumValueDescriptor(
      name='E1', index=0, number=0,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
    _descriptor.EnumValueDescriptor(
      name='E2', index=1, number=1,
      serialized_options=None,
      type=None,
      create_key=_descriptor._internal_create_key),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=58,
  serialized_end=77,
)
_sym_db.RegisterEnumDescriptor(_BAR_B)


_BAR = _descriptor.Descriptor(
  name='Bar',
  full_name='template.Bar',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='b', full_name='template.Bar.b', index=0,
      number=1, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _BAR_B,
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=23,
  serialized_end=77,
)

_BAR.fields_by_name['b'].enum_type = _BAR_B
_BAR_B.containing_type = _BAR
DESCRIPTOR.message_types_by_name['Bar'] = _BAR
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Bar = _reflection.GeneratedProtocolMessageType('Bar', (_message.Message,), {
  'DESCRIPTOR' : _BAR,
  '__module__' : 'bar_pb2'
  # @@protoc_insertion_point(class_scope:template.Bar)
  })
_sym_db.RegisterMessage(Bar)


DESCRIPTOR._options = None
# @@protoc_insertion_point(module_scope)