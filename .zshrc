
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/kavin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Eza
alias ls='eza'
alias l='eza -l' # Long format
alias la='eza -la' # Long format with all files
alias lsd='eza --tree' # Tree view

# Edit a hypr config
hypr() {
	vim "$HOME/.config/hypr/$1"
}

# Zoxide
alias cd='z'

#eval "$(oh-my-posh init zsh)"
#eval "$(oh-my-posh init zsh --config ~/.config/.oh-my-posh/bubbles.omp.json)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# End of lines configured by zsh-newuser-install
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh


# Created by `pipx` on 2024-08-07 21:32:28
export PATH="$PATH:/home/kavin/.local/bin"
