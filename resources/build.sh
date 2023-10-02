#!/bin/sh
swift build -c release
cp .build/release/jelly ./jelly
