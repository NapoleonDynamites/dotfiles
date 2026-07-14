export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

autoload -Uz compinit
compinit

eval "$(oh-my-posh init zsh --config ~/.config/catppuccin_mocha.omp.json)"

if [[ -f "$HOME/.ssh/id_ed25519" ]]; then
  eval "$(keychain --eval --quiet "$HOME/.ssh/id_ed25519")"
else
  eval "$(keychain --eval --quiet)"
fi

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
setopt interactive_comments
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export EDITOR='nvim'

alias v="nvim"
alias zshupd="exec zsh"

alias zj="zellij"
alias zja="zellij attach"
alias zjl="zellij list-sessions"

zjdev() { zellij attach dev || zellij --new-session-with-layout dev --session dev; }
zjdot() { zellij attach dotfiles || zellij --new-session-with-layout dotfiles --session dotfiles; }
zjops() { zellij attach ops || zellij --new-session-with-layout ops --session ops; }
