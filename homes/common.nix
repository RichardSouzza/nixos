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
    distrobox
    distrobox-tui
    dotnet-sdk_10     # .Net
    dotnet-runtime_10
    dotnet-ef
    git-extras gitnr  # Git Gang
    fastfetch         # System informations
    fzf
    gtrash            # Trash manager
    # jetbrains.rider
    libgcc
    lsd               # LS Deluxe
    nodejs
    posting           # HTTP client
    python311
    ripdrag           # Drag and drop
    sqlfluff
    systemctl-tui     # Systemd services manager
    television        # Fuzzy file finder
    tgpt              # Chat AI on the terminal
    tree              # Tree view
    zlib
  ];
}
