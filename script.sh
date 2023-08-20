#! /bin/bash


foo() {
    echo foo $1
}

main() {
    foo 1
    foo 2
}

if [ "${1}" != "--source-only" ]; then
    main "${@}"
fi
