export PATH=/usr/local/bin:$PATH

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
# export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="norm"
# export ZSH_THEME="nebirhos"
# Node JS settings
export NODE_PATH="/usr/local/lib/node"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow rails3 bundler zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

. `brew --prefix`/etc/profile.d/z.sh
 function precmd () {
   z --add "$(pwd -P)"
 }

# zle-line-init() {
#   # Reset correctall in case finish unset it
#   setopt no_localoptions correctall
# }
# zle-line-finish() {
#   if [[ $BUFFER = (${~CORRECTALL_IGNORE})* ]]
#   then setopt no_localoptions no_correctall
#   fi
# }
# zle -N zle-line-init
# zle -N zle-line-finish
# 
# CORRECTALL_IGNORE="git flow feature | rvm use | git | bundle exec rspec"
source "`brew --prefix grc`/etc/grc.bashrc"
