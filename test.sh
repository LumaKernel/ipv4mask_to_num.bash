#!/bin/bash

SCRIPT_DIR="$(realpath "$(dirname "$0")")"
source "$SCRIPT_DIR/ipv4mask_to_num.sh"

TEST_CASES=({{0,128,192,224,240,248,252,254}.0.0.0,255.{{0,128,192,224,240,248,252,254}.0.0,255.{{0,128,192,224,240,248,252,254}.0,255.{0,128,192,224,240,248,252,254,255}}}})

echo "========="
FAIL=0
for i in {0..32}; do
  TEST_CASE=${TEST_CASES[$i]}
  EXPECTED=$i
  ACTUAL="$(ipv4mask_to_num $TEST_CASE)"
  echo -n "Case#$(printf "%02d" $i) $TEST_CASE: "
  if test "$EXPECTED" != "$ACTUAL"; then
    (( FAIL = 1 ))
    echo "FAIL"
    echo "Expected: $EXPECTED"
    echo "Actual  : $ACTUAL"
  else
    echo "OK"
  fi
  echo "========="
done

echo -n "Result: "
if (( FAIL )); then
  echo "FAIL"
  exit 1
else
  echo "OK"
fi
