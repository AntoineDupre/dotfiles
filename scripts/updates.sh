#!/usr/bin/env bash

UPDATES=$(apt list --upgradable 2>/dev/null | wc -l)
[[ "${UPDATES}" = "0" ]] && exit 0

echo "   ${UPDATES} "
exit 0
