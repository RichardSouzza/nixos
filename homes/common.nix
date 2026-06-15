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

  home.username = "richard";
  home.homeDirectory = "/home/richard";

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs = {
    home-manager.enable = true;

    nixvim = {
      enable = true;
      defaultEditor = true;
    };
  };

  home.file = {
    ".config/opencode/opencode.json".source = ./shared/opencode/opencode.json;
  };

  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
  };
  home.sessionPath = [
    "$HOME/.dotnet/tools"
  ];

  home.packages = with pkgs; [
  # Pkg name          # Description
    bat jq            # Utils
    charasay          # Gabby characters
    # distrobox
    # distrobox-tui
    git-extras gitnr  # Git Gang
    fastfetch         # System informations
    fzf
    gtrash            # Trash manager
    # jetbrains.rider
    libgcc
    lsd               # LS Deluxe
    python311
    ripdrag           # Drag and drop
    systemctl-tui     # Systemd services manager
    television        # Fuzzy file finder
    tgpt              # Chat AI on the terminal
    tree              # Tree view
    zlib
  ];
}
