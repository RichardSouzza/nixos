{ inputs, pkgs, system, ... }:

{
  imports = [
    inputs.nixvim.homeModules.${system}.nixvim
    ../modules/home/system/starship
    ../modules/home/system/zsh
    ../modules/home/tools/btop
    ../modules/home/tools/git
    ../modules/home/tools/gtt
    ../modules/home/tools/lazygit
    ../modules/home/tools/libqalculate
    ../modules/home/tools/scooter
    ../modules/home/tools/tealdeer
    ../modules/home/tools/yazi
    ../modules/options
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.username = "richard";
  home.homeDirectory = "/home/richard";

  home.packages = with pkgs; [
  # ===================================================
  # Pkg Name                    # Description
  # ===== Utils =======================================
    bat jq                      # Utils
    charasay                    # Gabby characters
    chroncal                    # Calendar
    git-crypt git-extras gitnr  # Git Gang
  # ===== Dev stuff ===================================
    nodejs                      # Node.js
    python312                   # Python
  # ===== Sys utils ===================================
    fastfetch                   # System informations
    fzf                         # Fuzzy finder
    gtrash                      # Trash manager
    lsd                         # LS Deluxe
    ripgrep                     # Fastter grep
    tree                        # Tree view
  ];

  home.file = {
    ".config/opencode/opencode.json".source = ../modules/home/tools/opencode/opencode.json;
  };

  programs = {
    home-manager.enable = true;

    nixvim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
