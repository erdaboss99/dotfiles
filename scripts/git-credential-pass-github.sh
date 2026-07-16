#!/usr/bin/env bash

[[ $1 == get ]] || exit 0
printf 'username=x\npassword=%s\n' "$(pass show "github/${GH_ACCOUNT:-wizzair}")"
