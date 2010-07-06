#!/bin/sh
function failed()
{
    echo "Failed: $@" >&2
    exit 1
}

set -ex

. "$WORKSPACE/buildScripts/build.config"

/usr/local/checker/scan-build xcodebuild -configuration $CONFIGURATION -sdk $SDK clean GCC_GENERATE_TEST_COVERAGE_FILES=YES PREBINDING=NO GCC_OPTIMIZATION_LEVEL=0;
/usr/local/checker/scan-build -o html xcodebuild -configuration "Debug" -sdk $SIMULATOR -target LogicTests GCC_GENERATE_TEST_COVERAGE_FILES=YES PREBINDING=YES GCC_OPTIMIZATION_LEVEL=0 DEAD_CODE_STRIPPING=YES GCC_DEBUGGING_SYMBOLS=full GENERATE_PROFILING_CODE=YES GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES OTHER_LDFLAGS=" -L//Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.0.sdk/usr/lib/gcc/i686-apple-darwin10/4.2.1/ -fprofile-arcs -lgcov -prebind "| /usr/local/bin/ocunit2junit.rb;

