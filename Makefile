.PHONY: install switch update

install:
	nix run . switch
	home-manager switch
	rustup default stable

switch:
	home-manager switch

update:
	nix --option commit-lockfile-summary "[Nix] Update flake.lock" flake update --update-lock-file
