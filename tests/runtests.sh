#!/bin/sh
# vim: set expandtab softtabstop=2 tabstop=2 shiftwidth=2 :

set -x

SCRIPT_PATH=$(dirname $0)

if test -z "$PARSER_PATH"; then
  PARSER_PATH=$SCRIPT_PATH/../parser
fi
if test -z "$GENSRC_PATH"; then
  GENSRC_PATH=$SCRIPT_PATH/../gensrc
fi

run_test_parser() {
  local tstname="$1"

  ${PARSER_PATH} $tstname.in > $tstname.out

  diff -u $tstname.out $tstname.expected
}

run_test() {
  local tstname="$1"

  case $tstname in
    */parser/*)
      echo parser test $tstname
      run_test_parser $tstname
      ;;
    */gensrc/*)
      echo gensrc test $tstname
      ;;
  esac
}

main() {
  if test "$#" -eq 0; then
    eval set -- $(find $SCRIPT_PATH -iname \*.s.in)
  fi

  local rv=
  local tst=
  local failed=""

  for tst; do
    tst="${tst%.in}"
    set +e
    (set -e; run_test $tst)
    rv=$?
    if test $rv -ne 0; then
      failed="$failed $tst"
    fi
  done

  if test -n "$failed"; then
    echo "FAILED: $failed"
    exit 1
  fi
}

main "$@"
