.PHONY: install switch update gc diff

switch:
	home-manager switch

install:
	nix run . switch
	home-manager switch
	rustup default stable

update:
	nix --option commit-lockfile-summary "[Nix] Update flake.lock" flake update --commit-lock-file
	home-manager switch

gc:
	home-manager expire-generations "-30 days"
	nix-collect-garbage

diff:
	nix profile diff-closures --profile /nix/var/nix/profiles/per-user/cloud/home-manager
