{ pkgs, ... }: {
  home.username = "cloud";
  home.homeDirectory = "/Users/cloud";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  
  home.packages = [
    pkgs.git
    pkgs.neovim
  ];
}
