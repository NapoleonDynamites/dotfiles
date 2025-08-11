# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Path to your Oh My Zsh installation.
#export ZSH="$HOME/.oh-my-zsh"
#eval "$(oh-my-posh init zsh --config ~/dotfiles/oh-my-posh.yml)"
eval "$(oh-my-posh init zsh --config ~/dotfiles/catppuccin_mocha.omp.json)"
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
setopt interactive_comments # Fix for zsh-autocomplete
export PATH=$PATH:/home/iaroslav/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin
export PATH="$HOME/.local/bin:$PATH"
#source $ZSH/oh-my-zsh.sh

#source <(fzf --zsh)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v="nvim"
alias zalupa="STM32_Programmer_CLI"
alias zshupd="exec zsh"
alias sw="exec ~/openvpn_configs/startvpn"

