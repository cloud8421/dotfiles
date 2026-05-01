eval "$(starship init zsh)"

bindkey -e

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Can append comments to interactive commands
setopt interactivecomments

[ -f ~/.ghcup/env ] && source ~/.ghcup/env

alias s='git status --short'
alias l='git lg'
alias gco='git branch | sort -r | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout'
alias gru='git reset --hard @{upstream}'

alias ls='eza'
alias ll='eza -lbGF --git'
alias llm='eza -lbGd --git --sort=modified'
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'

# specialty views
alias lS='eza -1'
alias lt='eza --tree --level=2'
alias l.="eza -a | grep -E '^\.'"

alias mr='mise run'

alias clin='clockify-cli in'
alias clout='clockify-cli out'

export EDITOR=nvim
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export KERL_BUILD_DOCS=yes
export KERL_CONFIGURE_OPTIONS="--without-javac"
export ERL_AFLAGS="-kernel shell_history enabled"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export PATH="$HOME/tools:$PATH"
export PATH="$HOME/.local/bin:$PATH"

eval "$(mise activate zsh)"
eval "$(direnv hook zsh)"
eval "$(atuin init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

ulimit -n 20480
