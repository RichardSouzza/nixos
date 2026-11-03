{ inputs, pkgs, system, ... }:

{
  imports = [
    inputs.nixvim.homeModules.${system}.nixvim
    ./shared/btop
    ./shared/git
    ./shared/gtt
    ./shared/lazygit
    ./shared/libqalculate
    ./shared/scooter
    ./shared/starship
    ./shared/tealdeer
    ./shared/yazi
    ./shared/zsh
    ../packages
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.username = "richard";
  home.homeDirectory = "/home/richard";

  home.packages = with pkgs; [
  # ============================================
  # Pkg Name          # Description
  # ===== Utils ================================
    bat jq            # Utils
    charasay          # Gabby characters
    chroncal          # Calendar
    git-extras gitnr  # Git Gang
    fastfetch         # System informations
    fzf               # Fuzzy finder
  # ===== Dev stuff ============================
    nodejs            # Node.js
    python312         # Python
  # ===== Sys utils ============================
    gtrash            # Trash manager
    lsd               # LS Deluxe
    tgpt              # Chat AI on the terminal
    tree              # Tree view
  ];

  home.file = {
    ".config/opencode/opencode.json".source = ./shared/opencode/opencode.json;
  };

  programs = {
    home-manager.enable = true;

    nixvim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
