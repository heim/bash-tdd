#!/bin/bash

it_counts_multiple_files_and_revsions() {
  echo > bar.rb
  commit_file bar.rb
  echo > foo.rb
  commit_file foo.rb
  echo "hei" >> bar.rb
  commit_file bar.rb
  assertEquals "1,foo.rb
2,bar.rb" "`../churn.sh`"
}
it_counts_multiple_revisions() {
  echo > foo.rb
  commit_file foo.rb
  echo "hei" >> foo.rb
  commit_file foo.rb
  assertEquals "2,foo.rb" "`../churn.sh`"
}

it_counts_one_file() {
  echo > foo.rb
  commit_file foo.rb
  assertEquals "1,foo.rb" "`../churn.sh`"
}

it_counts_two_files() {
  echo > bar.rb
  commit_file bar.rb
  echo > foo.rb
  commit_file foo.rb
  assertEquals "1,bar.rb
1,foo.rb" "`../churn.sh`"
}

commit_file() {
  git add $1
  git commit -q -m 'message'
}
. test_helper.sh
