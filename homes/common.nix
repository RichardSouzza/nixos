{ config, inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./shared/btop
    ./shared/git
    ./shared/gtt
    ./shared/nixvim
    ./shared/starship
    ./shared/yazi
    ./shared/zsh
    ../packages
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    gh gitnr lazygit # Git Gang
    fastfetch        # System informations
    gtrash           # Trash manager
    libqalculate     # Calculator
    lsd              # LS Deluxe
    systemctl-tui    # Systemd services manager
    tealdeer         # Cheatsheets
    television       # Fuzzy file finder
  ];
}
