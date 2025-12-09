{ inputs, pkgs, ... }:

{
  imports = [
    ./shared/btop
    ./shared/git
    ./shared/gtt
    ./shared/lazygit
    ./shared/neovim
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
  };

  programs = {
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
  # Pkg name         # Description
    bat jq           # Utils
    charasay         # Gabby characters
    git-extras gitnr # Git Gang
    fastfetch        # System informations
    gtrash           # Trash manager
    libqalculate     # Calculator
    lsd              # LS Deluxe
    posting          # HTTP client
    systemctl-tui    # Systemd services manager
    television       # Fuzzy file finder
    tgpt             # Chat AI on the terminal
    tree             # Tree view
    # ========== My Neovim ===========================
    inputs.neovim.packages.${pkgs.system}.default
  ];
}
