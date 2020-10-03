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

test.go:
	GOOS=$(shell go env GOHOSTOS) GOARCH=$(shell go env GOHOSTARCH) CGO_ENABLED=1 \
	go test -mod=readonly -v -failfast -covermode=atomic -race -cpu 1,2,4 \
	-coverprofile=coverage.go.txt -coverpkg=./templategopb/... ./templategopb/...

test.python:
	pipenv run pytest \
		--strict -vvl \
		--cov=templatepythonpb \
		--cov-report=term-missing \
		templatepythonpb/test \
		|| code=$$?; if [ $$code != 5 ]; then echo "exit code: $$code"; exit $$code; fi

test.c:
	# TODO: add tests for c protobuf files
	:

test.rust:
	cargo test

test.all: \
	test.go \
	test.python \
	test.c
