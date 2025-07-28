#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# dnf5 install -y tmux

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 copr enable --assumeyes solopasha/hyprland
dnf5 copr enable --assumeyes peterwu/rendezvous
# dnf5 copr enable --assumeyes wef/cliphist
dnf5 copr enable --assumeyes tofik/nwg-shell
dnf5 copr enable --assumeyes erikreider/SwayNotificationCenter

dnf5 install --assumeyes --skip-unavailable xdg-user-dirs hyprland hyprpaper hyprlock hypridle hyprpicker xdg-desktop-portal-hyprland libnotify qt5-qtwayland qt6-qtwayland uwsm xdg-desktop-portal-gtk python-pip python3-gobject python-screeninfo tumbler brightnessctl nm-connection-editor network-manager-applet gtk4 libadwaita fuse blueman waypaper nwg-look nwg-displays qt6ct waybar rofi-wayland pavucontrol papirus-icon-theme papirus-icon-theme-dark breeze flatpak SwayNotificationCenter gvfs wlogout bibata-cursor-themes NetworkManager-tui nwg-dock-hyprland

dnf5 remove --assumeyes kitty xclip wget unzip rsync git nautilus neovim htop zsh fzf vlc jq gum figlet fastfetch ImageMagick wl-clipboard grim slurp cliphist matugen google-noto-emoji-fonts google-noto-sans-cjk-fonts fontawesome-fonts dejavu-fonts-all

# replacing noto-fonts with google-noto-fonts-common
# replacing xclip with wl-clipboard
# Cleaning up to keep the base as small as possible
# Following packages will be installed using nix/home-manager
# wget unzip rsync git kitty nautilus neovim htop zsh fzf vlc jq gum figlet fastfetch ImageMagick wl-clipboard grim slurp cliphist matugen
# Similarly Fonts will be installed using nix/home-manager
# google-noto-fonts-common google-noto-emoji-fonts google-noto-sans-cjk-fonts fontawesome-fonts dejavu-fonts-all

dnf5 copr disable --assumeyes solopasha/hyprland
dnf5 copr disable --assumeyes peterwu/rendezvous
# dnf5 copr disable --assumeyes wef/cliphist
dnf5 copr disable --assumeyes tofik/nwg-shell
dnf5 copr disable --assumeyes erikreider/SwayNotificationCenter

#### Example for enabling a System Unit File

# systemctl enable podman.socket

# create /nix for standalone nix installation

mkdir /nix
