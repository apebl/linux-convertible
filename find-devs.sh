#!/bin/sh

# find-devs.sh:
# Find input devices that should be disabled in tablet mode.
#

set -e

xinput list |
grep -oP '(?<=↳ )[A-Za-z0-9_: -]+?(?=\s*id=)' |
grep -iP 'keyboard|touchpad|trackpoint' |
grep -i --invert-match 'XTEST'
