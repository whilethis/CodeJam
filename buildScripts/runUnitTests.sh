#!/bin/sh
function failed()
{
    echo "Failed: $@" >&2
    exit 1
}

set -ex

. "$WORKSPACE/buildScripts/build.config"

xcodebuild -configuration $config -sdk $sdk clean;
xcodebuild -configuration "Debug" -sdk $SIMULATOR -target LogicTests | /usr/local/bin/ocunit2junit.rb;

