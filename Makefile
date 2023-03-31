.PHONY: install switch update

switch:
	home-manager switch

install:
	nix run . switch
	home-manager switch
	rustup default stable

update:
	nix --option commit-lockfile-summary "[Nix] Update flake.lock" flake update --commit-lock-file
	home-manager switch
