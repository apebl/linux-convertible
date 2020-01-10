#!/bin/sh
set -e
set -o xtrace

mkdir -p "$HOME/.convertible"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.config/autostart"

cp -ip bin/* "$HOME/.local/bin"
cp -ip callbacks/* "$HOME/.convertible"
cp -ip tablet-mode.desktop "$HOME/.local/share/applications"
cp -ip rotation-lock.desktop "$HOME/.local/share/applications"
cp -ip convertible-startup.desktop "$HOME/.config/autostart"

sh find-devs.sh | while read -r dev; do
    echo "xinput enable '$dev'" >> "$HOME/.convertible/laptop"
    echo "xinput disable '$dev'" >> "$HOME/.convertible/tablet"
done
