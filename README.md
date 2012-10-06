# Dotfiles configuration

## Installation

This configuration runs on a Mac, tested on Mountain Lion.

Please use the Homebrew versions of all listed tools.

Vim is required with clipboard and Ruby support.

Clone and then run:

    rake install

To update submodules:

    rake update_submodules

Uses RVM.

## Prerequisites

    brew install reattach-to-user-namespace
    brew install tmux ack the_silver_surfer fishfish zsh bash
    brew install macvim --override-system-vim
    gem install pry

## What's included:

- Vim configuration for Ruby, Rails, and JS development with mouse support.
- Tmux configuration with mouse support (use iTerm 2 with screen-256colors ).
- Fish shell configuration with autocompletion for useful stuff
- ZSH with oh-my-zsh (there for legacy)
- Configurations for CTags, Ack, The Silver Surfer, Pry, Git, Pow
- Glue to keep it all together
