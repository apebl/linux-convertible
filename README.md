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
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
```

And restart your session. (log-out & log-in again)

## Usage

Use application entries `Tablet Mode` and `Rotation Lock` created in the
applications menu.

- Tablet Mode: Toggle tablet mode
- Rotation Lock: Toggle screen rotation lock

## Configuration

There are callback script files in `~/.convertible`:

- `~/.convertible/landscape`: Called when switched to landscape orientation.

By default, it moves the dock panel to the left. (GNOME Shell dash-to-dock)

- `~/.convertible/portrait`: Called when switched to portrait orientation.

By default, it moves the dock panel to the bottom. (GNOME Shell dash-to-dock)

- `~/.convertible/laptop`: Called when switched to laptop mode.

By default, it enables keyboards, touchpads, and trackpoints.

- `~/.convertible/tablet`: Called when switched to tablet mode.

By default, it starts auto-maximizing and disables keyboards, touchpads, and
trackpoints.

