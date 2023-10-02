#!/bin/sh
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
swiftc -target wasm32-unknown-wasi hello.swift -o wasm/hello.wasm
wasmer wasm/hello.wasm