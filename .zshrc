
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/kavin/.zshrc'

autoload -Uz compinit colors
compinit
colors

setopt notify
setopt share_history

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

alias ls='eza --color=always --group-directories-first --icons --classify=auto'
alias ll='eza -la --icons --octal-permissions --group-directories-first --classify=auto'
alias l='eza -bGF --header --git --color=always --group-directories-first --icons --classify=auto'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons --classify=auto'
alias la='eza --long --all --group --group-directories-first --classify=auto'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons --classify=auto'

alias lS='eza -1 --color=always --group-directories-first --icons --classify=auto'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons --classify=auto'
alias l.="eza -a | grep -E '^\.'"   # leave this one as is since it's piped to grep

# Zoxide
alias cd='z'

eval "$(zoxide init zsh)"

export STARSHIP_CONFIG=/home/kavin/.config/starship/starship.toml
eval "$(starship init zsh)"

# End of lines configured by zsh-newuser-install
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh


# Created by `pipx` on 2024-08-07 21:32:28
# export PATH="$PATH:/home/kavin/.local/bin"

# bun completions
[ -s "/home/kavin/.bun/_bun" ] && source "/home/kavin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
export EDITOR=vim

# export PATH="$PATH:/home/kavin/.modular/bin"
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/kavin/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/kavin/miniforge3/etc/profile.d/conda.sh" ]; then
#         . "/home/kavin/miniforge3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/kavin/miniforge3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
# 
