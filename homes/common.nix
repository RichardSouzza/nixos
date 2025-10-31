{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./shared/btop
    ./shared/git
    ./shared/gtt
    ./shared/lazygit
    ./shared/nixvim
    ./shared/starship
    ./shared/tealdeer
    ./shared/yazi
    ./shared/zsh
    ../packages
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "mono-4.8.1.0" ];
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bat jq           # Utils
    charasay         # Gabby characters
    git-extras gitnr # Git Gang
    fastfetch        # System informations
    gtrash           # Trash manager
    libqalculate     # Calculator
    lsd              # LS Deluxe
    mono4            # .Net support
    systemctl-tui    # Systemd services manager
    television       # Fuzzy file finder
    tgpt             # Chat AI on the terminal
    tree             # Tree view
  ];
}
