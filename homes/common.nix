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
    ../modules/home
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
  # ===== Dev stuff ============================
    nodejs            # Node.js
    python312         # Python
  # ===== Sys utils ============================
    fastfetch         # System informations
    fzf               # Fuzzy finder
    gtrash            # Trash manager
    lsd               # LS Deluxe
    ripgrep           # Fastter grep
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
