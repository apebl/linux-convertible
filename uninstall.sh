#!/bin/sh
set -e
set -o xtrace

rm -ri "$HOME/.convertible"

pushd "$HOME/.local/bin"
rm -i auto-rotation convertible convertible-startup keep-scaling rotation-lock tablet-maxwin
popd

rm -i "$HOME/.local/share/applications/tablet-mode.desktop"
rm -i "$HOME/.local/share/applications/rotation-lock.desktop"
rm -i "$HOME/.config/autostart/convertible-startup.desktop"
