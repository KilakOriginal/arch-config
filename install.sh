#!/bin/bash

# Install yay
pacman -Sy --noconfirm git
pacman -Sy --noconfirm go
pacman -Sy --noconfirm sudo

# Temporäres Verzeichnis erstellen und zu diesem wechseln
tmp_dir=$(mktemp -d)
cd "$tmp_dir" || exit

# Clone and make
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si --noconfirm

# Cleanup
cd ..
rm -rf "$tmp_dir"


# extra packages
pacman -Sy --noconfirm wayland
pacman -Sy --noconfirm hyprland
pacman -Sy --noconfirm flameshot
pacman -Sy --noconfirm waybar
pacman -Sy --noconfirm neovim
pacman -Sy --noconfirm kitty
pacman -Sy --noconfirm nemo
pacman -Sy --noconfirm rofi
pacman -Sy --noconfirm wlogout
pacman -Sy --noconfirm zoxide
pacman -Sy --noconfirm sddm
pacman -Sy --noconfirm firefox
pacman -Sy --noconfirm thunderbird
pacman -Sy --noconfirm brightnessctl
pacman -Sy --noconfirm pipewire
pacman -Sy --noconfirm pipewire-pulse
pacman -Sy --noconfirm pipewire-alsa
pacman -Sy --noconfirm wireplumber
pacman -Sy --noconfirm bluez
pacman -Sy --noconfirm bluez-utils
pacman -Sy --noconfirm ruby

# aur packages
yay --sudoloop --noconfirm swww
yay --sudoloop --noconfirm hyprshot
yay --sudoloop --noconfirm wvkbd
yay --sudoloop --noconfirm wezterm-git
yay --sudoloop --noconfirm swaylock-effects-git
yay --sudoloop --noconfirm swayidle
yay --sudoloop --noconfirm wlogout
yay --sudoloop --noconfirm sddm-sugar-candy-git

# curl 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# systemctl services
#TODO


mkdir -p ~/.config

ln -sf ${PWD}/user/.* $HOME
ln -sf ${PWD}/user/* $HOME
ln -sf ${PWD}/config/* $HOME/.config
ln -sf ${PWD}/assets/Wallpapers/* $HOME/Pictures/Wallpapers