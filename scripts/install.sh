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

_download_go_pakage() {
  GO111MODULE=off go get -u -v -d "$1"
}

_install_go_bin() {
  package="$1"
  cmd_dir="$2"
  bin="$3"

  # download
  temp_dir="$(mktemp -d)"
  cd "${temp_dir}"
  GO111MODULE=on go get -d -u "${package}"
  cd -
  rmdir "${temp_dir}"

  # build
  cd "${GOPATH}/pkg/mod/${package}"
  GO111MODULE=on go build -o "${bin}" "${cmd_dir}"
  cd -
}

_install_tools_go() {
  GOPATH=$(go env GOPATH)
  export GOPATH

  GOOS=$(go env GOHOSTOS)
  GOARCH=$(go env GOHOSTARCH)
  export GOOS
  export GOARCH

  cd "$(mktemp -d)"
  _download_go_pakage github.com/gogo/protobuf/proto
  _download_go_pakage github.com/gogo/protobuf/gogoproto

  _install_go_bin "github.com/golang/protobuf@v1.4.3" "./protoc-gen-go" "${GOPATH}/bin/protoc-gen-go"
  _install_go_bin "github.com/gogo/protobuf@v1.3.2" "./protoc-gen-gogoslick" "${GOPATH}/bin/protoc-gen-gogoslick"
  cd -
}

_install_tools_python() {
  if ! command -v pipenv; then
    echo "please install pipenv first, ref: https://docs.pipenv.org/install/#installing-pipenv"
    exit 1
  fi

  pipenv install --dev --deploy
}

_install_tools_c() {
  _install_tools_python

  if [ ! -d build/nanopb ]; then
    git clone --depth 1 -b 0.4.4 https://github.com/nanopb/nanopb.git build/nanopb
  fi
}

_install_tools_rust() {
  _install_tools_python

  if [ ! -d build/pb-jelly ]; then
    git clone --depth 1 -b master https://github.com/dropbox/pb-jelly build/pb-jelly
    cd build/pb-jelly
    git checkout dd596318b974b5a7540b0e1a1553747a9ae8fc1a
    cd -
  fi
}

CODE_LANG=$(printf "%s" "$@" | cut -d. -f3)

"_install_tools_${CODE_LANG}"
