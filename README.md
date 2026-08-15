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

## VPN Workflow

VPN is managed directly through `openconnect` and `wg-quick`, not through NetworkManager.

`Super + S` -> `Network` -> `VPN` opens a profile list:

- `openconnect` profiles are read from `~/.config/vpn/openconnect/*.env`
- WireGuard profiles are read from `~/.config/vpn/wireguard/*.conf`
- files ending with `.example` are templates and are ignored
- active profiles are shown with `●`, inactive profiles with `○`
- selecting a profile toggles connect/disconnect in a terminal, so `sudo` can ask for a password

The Waybar VPN icon appears only while at least one VPN profile is active.

OpenConnect profile setup:

```sh
cp ~/.config/vpn/openconnect/example.env.example ~/.config/vpn/openconnect/work.env
mkdir -p ~/.local/secrets
printf '%s\n' 'PASSWORD_HERE' > ~/.local/secrets/work-vpn.pass
chmod 600 ~/.local/secrets/work-vpn.pass
```

WireGuard profile setup:

```sh
cp ~/.config/vpn/wireguard/example.conf.example ~/.config/vpn/wireguard/work.conf
```

Real `*.env` and `*.conf` VPN profiles are ignored by git. Templates stay in dotfiles.

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
- `Alt c` — scroll mode
- `Alt e` — edit scrollback in nvim
- `Ctrl g` — exit locked mode

## Install

Run:

```sh
./install.sh
```

The install script installs packages from `packages` and links configs into `~/.config`.
