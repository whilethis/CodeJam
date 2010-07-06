#!/bin/sh
function failed()
{
    echo "Failed: $@" >&2
    exit 1
}

set -ex

. "$WORKSPACE/buildScripts/build.config"

xcodebuild -configuration "Debug" -sdk $SDK clean GCC_GENERATE_TEST_COVERAGE_FILES=YES PREBINDING=NO GCC_OPTIMIZATION_LEVEL=0;
/usr/local/checker/scan-build -o html xcodebuild -configuration "Debug" -sdk $SIMULATOR -target LogicTests GCC_GENERATE_TEST_COVERAGE_FILES=YES PREBINDING=YES GCC_OPTIMIZATION_LEVEL=0 DEAD_CODE_STRIPPING=YES | /usr/local/bin/ocunit2junit.rb;

