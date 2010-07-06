#!/bin/sh
function failed()
{
    echo "Failed: $@" >&2
    exit 1
}

set -ex

. "$WORKSPACE/buildScripts/build.config"

xcodebuild -configuration "Debug-GCov" -sdk $SIMULATOR clean
xcodebuild -configuration "Debug-GCov" -sdk $SIMULATOR -target LogicTests | /usr/local/bin/ocunit2junit.rb;

