.PHONY: switch update

switch:
	home-manager switch

update:
	nix flake update --commit-lock-file
