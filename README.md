# Dotfiles

## Main Components

- Hyprland — window manager
- Waybar — top bar
- Alacritty / WezTerm — terminals
- Zellij — terminal workspace/session manager
- Fuzzel — app launcher
- Yazi — terminal file manager
- Firefox — browser and default image/PDF viewer
- VLC — default video player
- Neovim — editor and fallback opener from Yazi

## File Workflow

`Super + M` opens Yazi in Alacritty.

Yazi is configured as a launcher-oriented file manager, not as an image preview UI:

- images open in Firefox
- PDFs open in Firefox
- videos open in VLC
- archives are extracted with `unar`
- everything else falls back to Neovim

System MIME defaults are stored in `config/mimeapps.list`, so `xdg-open` should also use Firefox for images/PDFs and VLC for videos.

Required packages are listed in `packages` under `File manager / media handling`:

- `yazi`
- `vlc`
- `xdg-utils`
- `7zip`
- `unarchiver`
- `zoxide`

## Hyprland Keybinds

- `Super + T` — open terminal
- `Super + A` — app launcher
- `Super + S` — system menu
- `Super + M` — open Yazi file manager
- `Super + L` — lock screen
- `Super + P` — screenshot to clipboard
- `Super + Q` — close window
- `Super + F` — fullscreen window
- `Super + G` — toggle group
- `Super + Tab` — next window in group
- `Super + Arrow` — move focus
- `Super + Shift + Left/Right` — switch workspace
- `Super + 1..0` — switch workspace
- `Super + Shift + 1..0` — move window to workspace

## Zellij Keybinds

- `Alt h/j/k/l` — focus panes
- `Alt n` — new pane
- `Alt v` — split right
- `Alt s` — split down
- `Alt w` — close pane
- `Alt f` — fullscreen pane
- `Alt Space` — floating panes
- `Alt t` — new tab
- `Alt [` / `Alt ]` — previous/next tab
- `Alt r` — rename tab
- `Alt Shift h/j/k/l` — resize
- `Alt o` — session manager
- `Alt Shift o` — layout manager
- `Alt d` — detach
- `Alt q` — quit
- `Alt x` — locked mode
- `Ctrl g` — exit locked mode

## Install

Run:

```sh
./install.sh
```

The install script installs packages from `packages` and links configs into `~/.config`.
