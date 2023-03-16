# Dotfiles

Managed via [Nix](https://nixos.org/explore.html) and [Home Manager](https://github.com/nix-community/home-manager).

## Setup 

- Install Nix via [The Determinate Nix Installer](https://zero-to-nix.com/concepts/nix-installer).
- Clone this repo at `~/.config/home-manager`
- Run `make install`

## Changes

- Make relevant changes
- Run `make switch`

## Updating packages

- Run `make update`
- Run `git commit --amend` to amend the newly generated commit

## Credits

Thanks to Ju Liu for his straightforward guide at <https://juliu.is/tidying-your-home-with-nix/>.
