## GNU Make operational configuation

SHELL := bash
SHELLFLAGS := -euc

.DELETE_ON_ERROR:
.ONESHELL:


## Target parameters

TEST_DELAY ?= 4
OPEN_BIN ?= open


## External targets

test: .tmp/docker_image_created
	( sleep $(TEST_DELAY); $(OPEN_BIN) http://localhost:9999/test_runner.html ) &
	docker-compose up rollup livereload nginx
.PHONY: test

shell: .tmp/docker_image_created
	docker-compose run --rm shell /bin/bash
.PHONY: shell


## Internal targets

.tmp/docker_image_created: Dockerfile package.json | .tmp
	docker-compose build rollup
	touch $@

.tmp:
	mkdir $@
