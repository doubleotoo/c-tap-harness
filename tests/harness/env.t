#! /bin/sh
#
# Test suite for runtests directory search support.
#
# Copyright 2009, 2012 Russ Allbery <rra@stanford.edu>
#
# See LICENSE for licensing terms.

. "$SOURCE/tap/libtap.sh"
cd "$BUILD/harness/env"

# Total tests.
plan 1

# Run runtests on the env test list.
"${BUILD}/runtests" "${SOURCE}/harness/env/env.list" \
    | sed 's/\(Tests=[0-9]*\),  .*/\1/' > env.result
diff -u "${SOURCE}/harness/env/env.output" env.result 2>&1
status=$?
ok '' [ $status -eq 0 ]
if [ $status -eq 0 ] ; then
    rm env.result
fi
