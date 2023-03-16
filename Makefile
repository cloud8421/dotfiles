.PHONY: install switch update

install:
	nix run . switch
	home-manager switch
	rustup default stable

switch:
	home-manager switch

update:
	nix flake update --commit-lock-file
