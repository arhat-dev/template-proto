#!/bin/sh

# Copyright 2020 The arhat.dev Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

GOPATH=$(go env GOPATH)
export GOPATH

PROTO_SOURCE="./src/*.proto"

fix_pb_gen_json_name() {
  pb_files="$*"
  cmd_sed="sed"

  command -v gsed && cmd_sed="gsed"

  for f in ${pb_files}; do
    ${cmd_sed} -i -r 's/,json=(\w+?),omitempty,proto3" json:"\w+(,omitempty)?"/,json=\1,omitempty,proto3" json:"\1,omitempty"/g' "${f}"
    ${cmd_sed} -i -r 's/,json=(\w+?),proto3" json:"\w+(,omitempty)?"/,json=\1,proto3" json:"\1"/g' "${f}"
  done
}

_do_gen_proto_go() {
  # shellcheck disable=SC2086
  protoc \
    -I"${GOPATH}/src" \
    -I"${GOPATH}/src/github.com/gogo/protobuf/protobuf" \
    -I"./src" \
    --gogoslick_out "plugins=grpc:./template-gopb" \
    --gogoslick_opt "paths=source_relative" \
    ${PROTO_SOURCE}

  # fix_pb_gen_json_name ./template-gopb/*.pb.go
}

_do_gen_proto_c() {
  # shellcheck disable=SC2086
  pipenv run \
  python build/nanopb/generator/nanopb_generator.py \
    --no-timestamp \
    --output-dir ./template-nanopb \
    -I"./src" \
    ${PROTO_SOURCE}
}

CODE_LANG=$(printf "%s" "$@" | cut -d. -f3)

"_do_gen_proto_${CODE_LANG}"
