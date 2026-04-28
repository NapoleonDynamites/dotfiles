export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
eval "$(oh-my-posh init zsh --config ~/.config/catppuccin_mocha.omp.json)"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
plugins=(git)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
setopt interactive_comments # Fix for zsh-autocomplete

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

alias v="nvim"
alias zshupd="exec zsh"

