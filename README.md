# Dotfiles

Managed via [Nix](https://nixos.org/explore.html) and [Home Manager](https://github.com/nix-community/home-manager).

## Setup 

- Install Nix via [The Determinate Nix Installer](https://zero-to-nix.com/concepts/nix-installer).
- Clone this repo at `~/.config/nixpkgs`
- Run `nix run . switch`
- Run `home-manager switch`

## Caveats

- While the configuration installs `rustup` to manage rust installations, I haven't looked into how enabling the default toolchain automatically. So after the first time you run `home-manager switch`, you should also run `rustup default stable`.

## Credits

Thanks to Ju Liu for his straightforward guide at <https://juliu.is/tidying-your-home-with-nix/>.
