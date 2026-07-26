# i3wm Theme Manager

## License

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Overview

The i3wm Theme Manager is a lightweight, essentialist tool created to facilitate the management of i3 Window Manager configuration files, both in terms of aesthetics and functionality. With this tool, you can instantly change themes, update monitor layouts, and dynamically apply color schemes across your environment.

## Dependencies

The i3wm Theme Manager relies on fast and minimal Unix tools:

- **i3-wm** (with native gaps support): A dynamic tiling window manager.
- **Nitrogen**: A utility for setting and managing desktop wallpapers.
- **dmenu**: A lightning-fast, lightweight dynamic menu used for instant theme selection using current color schemes.
- **Picom**: An X11 window compositor configured with the `glx` backend, `dual_kawase` blur, and rounded corners.

### Installation

To install the dependencies on Arch-based systems, run:

```bash
sudo pacman -Syu i3-wm nitrogen dmenu picom
```

On Debian-based systems:

```bash
sudo apt-get update && sudo apt-get install i3-wm nitrogen dmenu picom
```

On Fedora:

```bash
sudo dnf install i3 nitrogen dmenu picom
```

## Installation

To install the i3wm Theme Manager, follow the instructions below:

1. Clone the repository:

```bash
git clone https://github.com/KennysSparda/i3-theme-manager.git ~/.config/i3-theme-manager
```

2. Save your current i3 configuration, as the i3wm Theme Manager will overwrite the `~/.config/i3/config` file with the corresponding file for the selected theme.

3. Run the program for the first time:

```bash
~/.config/i3-theme-manager/i3-theme-manager.sh
```

4. Add a shortcut to your i3 configuration file to launch the theme manager instantly (e.g., using `Mod+t`):

```conf
bindsym $mod+t exec --no-startup-id ~/.config/i3-theme-manager/i3-theme-manager.sh
```

## Usage and Customization

[![Vídeo](https://img.youtube.com/vi/OVR18_QjbZU/0.jpg)](https://youtu.be/OVR18_QjbZU)

### Example: Creation of a new theme

To create a new theme, follow these steps:

1. Create a new directory in `~/.config/i3-theme-manager/themes/my-new-theme`:

```bash
mkdir -p ~/.config/i3-theme-manager/themes/my-new-theme
```

2. Place an image file named `image` inside the directory. This image will be set as the wallpaper for the new theme.

3. Add your new theme option to the `options` variable inside `~/.config/i3-theme-manager/i3-theme-manager.sh`:

```bash
# [...]
menu() {
  options="red\nblue\ngreen\npurple\nmy-new-theme\nExit"
# [...]
  case $theme in
    red|blue|green|purple|my-new-theme)
      changeTheme "$theme"
      ;;
# [...]
```

4. In the configuration file `~/.config/i3-theme-manager/apply-color.sh`, create a new case block for your color palette using hexadecimal values:

```bash
  my-new-theme)
    primarycolor="#ffff00"
    secundarycolor="#333333"
    tertiarycolor="#000000"
    ;;
```

### Example: Configuration of monitors

To change outputs and display sizes, edit: `~/.config/i3-theme-manager/monitor-sizes.sh`
To list your connected monitors and resolutions, run:

```bash
xrandr --listmonitor
xrandr
```

### Contribution

If you would like to contribute to the i3wm Theme Manager, please follow the guidelines below:

- Fork the repository on GitHub.
- Make your desired changes.
- Submit a pull request describing your changes and the rationale behind them.

We welcome contributions from the community and appreciate any feedback or suggestions.

## Contact

You can reach me through the following channels:

- Portfolio: [kennyvargas.vercel.app](https://kennyvargas.vercel.app)
- GitHub: [github.com/KennysSparda](https://github.com/KennysSparda)
- LinkedIn: [linkedin.com/in/kenny-de-souza-vargas-8a521422a](https://linkedin.com/in/kenny-de-souza-vargas-8a521422a)
