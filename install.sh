#!/bin/sh

# Packet Installation

set -euo pipefail

if ! command -v pacman >/dev/null 2>&1; then
    echo "pacman not found — skipping pacman step"
    exit 0
fi

packages=($(grep -vE '^(#|$)' packages || true))


for pkg in "${packages[@]:-}"; do
    if ! pacman -Q "$pkg" &>/dev/null; then
        echo "Installing $pkg..."
        sudo pacman -S --noconfirm --needed "$pkg"
    else
        echo "$pkg already installed"
    fi
done

# Config linking

CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"

rm -rf "$HOME/.zshrc"
rm -rf "$CONFIG_DIR/nvim"
rm -rf "$CONFIG_DIR/wezterm"

ln -s ~/dotfiles/.zshrc ~/.zshrc 
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/wezterm ~/.config/wezterm
