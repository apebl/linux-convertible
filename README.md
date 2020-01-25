# linux-convertible

Tools for using 2-in-1 convertible laptops with Linux

## Features

- Auto-rotation and rotation lock (if DE doesn't provide it)
- Detecting orientation change
- Auto-maximizing windows in tablet mode (optional)
- Toggle between laptop and tablet mode manually
- Recovering xrandr orientation and scaling from abnormal xrandr changes

## Requirements

- notify-send (libnotify)

For X11 (not required for Wayland):

- xinput, xrandr (xinput)
- wmctrl, xdotool (Not required for GNOME)

## Install

```sh
git clone https://gitlab.com/kosmospredanie/linux-convertible.git
cd linux-convertible
./install.sh
```

You might need to add `$HOME/.local/bin` to your PATH:

```sh
mkdir -p ~/.config/environment.d
echo 'PATH=$HOME/.local/bin:$PATH' >> ~/.config/environment.d/path.conf
```

And restart your session. (log-out & log-in again)

## Usage

Use application entries `Tablet Mode` and `Rotation Lock` created in the
applications menu.

- Tablet Mode: Toggle tablet mode
- Rotation Lock: Toggle screen rotation lock

## Configuration

There are callback script files in `~/.convertible`:

- `~/.convertible/landscape`: Called when changed to landscape orientation.

- `~/.convertible/portrait`: Called when changed to portrait orientation.

- `~/.convertible/laptop`: Called when switched to laptop mode.

By default, it enables keyboards, touchpads, and trackpoints.

- `~/.convertible/tablet`: Called when switched to tablet mode.

By default, it starts auto-maximizing and disables keyboards, touchpads, and
trackpoints.

- `~/.convertible/display`: Called once on session startup, before
linux-convertible starts.

You can put your display settings to this script, and linux-convertible keeps
the settings. e.g.:

```sh
#!/bin/sh
[ "$XDG_SESSION_TYPE" = "x11" ] && xrandr --output eDP1 --scale 1.6
```

