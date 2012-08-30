#! /bin/bash

set -e

setUp() {
  if [[ `pwd` == *sandbox ]]; then
    cd ..
  fi
  if [ -e sandbox ]; then
    rm -rf sandbox
  fi
  mkdir sandbox
  cd sandbox
  git init > /dev/null
}

suite() {
  for test_name in `grep '^it_' $0 | cut -d '(' -f 1`; do
    suite_addTest $test_name
  done
}


. shunit2-2.1.6/src/shunit2
