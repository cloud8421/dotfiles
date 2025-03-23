eval "$(starship init zsh)"

bindkey -e

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

source <(fzf --zsh)

eval "$(mise activate zsh)"

[ -f ~/.ghcup/env ] && source ~/.ghcup/env

alias s='git status --short'
alias l='git lg'

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

eval "$(direnv hook zsh)"
