#!/bin/sh

# Packet Installation
# - Installs packages from 'packages' via pacman
# - Installs yay (AUR helper)
# - Installs packages from 'packages_aur' via yay
# - Links scripts & configs
#
# Usage:
#  - Create `packages` for pacman packages (one per line, '#' comments allowed)
#  - Create `packages_aur` for AUR packages (one per line, '#' comments allowed)

set -euo pipefail

if ! command -v pacman >/dev/null 2>&1; then
    echo "pacman not found — skipping pacman step"
    exit 0
fi

# -------------------------
# Pacman packages
# -------------------------
packages=($(grep -vE '^(#|$)' packages || true))

for pkg in "${packages[@]:-}"; do
    if ! pacman -Q "$pkg" &>/dev/null; then
        echo "Installing $pkg via pacman..."
        sudo pacman -S --noconfirm --needed "$pkg"
    else
        echo "$pkg already installed (pacman)"
    fi
done

# -------------------------
# Ensure yay is installed
# -------------------------
if ! command -v yay >/dev/null 2>&1; then
    echo "yay not found — installing yay from AUR"

    # Make sure required tools for building AUR packages are present
    sudo pacman -S --noconfirm --needed base-devel git

    TMPDIR="$(mktemp -d)"
    cleanup() {
        rm -rf "$TMPDIR"
    }
    trap cleanup EXIT

    echo "Cloning yay into $TMPDIR"
    git clone https://aur.archlinux.org/yay.git "$TMPDIR/yay"
    cd "$TMPDIR/yay"

    # Build and install yay. makepkg will prompt for sudo internally to install, but
    # --noconfirm is passed to avoid interactive prompts.
    echo "Building and installing yay..."
    makepkg -si --noconfirm
    cd -
else
    echo "yay already installed"
fi

# -------------------------
# AUR / yay packages
# -------------------------
# File containing AUR package names (one per line). Comment lines (#) and blank lines are ignored.
AUR_FILE="packages_aur"

if [ -f "$AUR_FILE" ]; then
    aur_packages=($(grep -vE '^(#|$)' "$AUR_FILE" || true))

    for pkg in "${aur_packages[@]:-}"; do
        if ! pacman -Q "$pkg" &>/dev/null; then
            echo "Installing $pkg via yay..."
            # Use --noconfirm and --needed to avoid prompts and skip already satisfied packages
            yay -S --noconfirm --needed "$pkg"
        else
            echo "$pkg already installed (pacman/yay)"
        fi
    done
else
    echo "No AUR package file '$AUR_FILE' found — skipping AUR installs"
fi

# -------------------------
# Scripts linking
# -------------------------

# -------------------------
# Config linking
# -------------------------
CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"

rm -rf "$HOME/.zshrc"
rm -rf "$HOME/.bash_profile"

rm -rf "$CONFIG_DIR/nvim"
rm -rf "$CONFIG_DIR/wezterm"
rm -rf "$CONFIG_DIR/catppuccin_mocha.omp.json"
rm -rf "$CONFIG_DIR/hypr"
rm -rf "$CONFIG_DIR/waybar"
rm -rf "$CONFIG_DIR/fuzzel"
rm -rf "$CONFIG_DIR/btop"
rm -rf "$CONFIG_DIR/gazelle"

ln -s ~/dotfiles/config/.zshrc ~/.zshrc 
ln -s ~/dotfiles/config/.bash_profile ~/.bash_profile 

ln -s ~/dotfiles/config/nvim ~/.config/nvim
ln -s ~/dotfiles/config/wezterm ~/.config/wezterm
ln -s ~/dotfiles/config/catppuccin_mocha.omp.json ~/.config/catppuccin_mocha.omp.json 
ln -s ~/dotfiles/config/hypr ~/.config/hypr
ln -s ~/dotfiles/config/waybar ~/.config/waybar
ln -s ~/dotfiles/config/fuzzel ~/.config/fuzzel
ln -s ~/dotfiles/config/btop ~/.config/btop
ln -s ~/dotfiles/config/gazelle ~/.config/gazelle

# Write this to /etc/security/faillock.conf
# deny = 0
# unlock_time = 0

echo "All done, modify /etc/security/faillock.conf" 
echo "And launch ./enable-autologin.sh"

