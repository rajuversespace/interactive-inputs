GO ?= go
SRC_DIR := src
GOCACHE_DIR := $(SRC_DIR)/.gocache

.PHONY: build test clean

build:
	cd $(SRC_DIR) && GOCACHE=$$(pwd)/.gocache $(GO) build ./...

test:
	cd $(SRC_DIR) && GOCACHE=$$(pwd)/.gocache $(GO) test ./...

clean:
	rm -rf $(GOCACHE_DIR)
