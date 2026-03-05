{ inputs, pkgs, system, ... }:

{
  imports = [
    inputs.nixvim.homeModules.${system}.nixvim
    ./shared/btop
    ./shared/git
    ./shared/gtt
    ./shared/lazygit
    ./shared/libqalculate
    ./shared/nushell
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
    dotnet-sdk_10     # .Net
    dotnet-runtime_10 #
    dotnet-ef         #
    git-extras gitnr  # Git Gang
    fastfetch         # System informations
    gtrash            # Trash manager
    lsd               # LS Deluxe
    nodejs_25         # Node.js
    ollama-rocm       # Ollama for AMD GPUs
    posting           # HTTP client
    python311
    python311Packages.pip
    sqlfluff
    systemctl-tui     # Systemd services manager
    television        # Fuzzy file finder
    tgpt              # Chat AI on the terminal
    tree              # Tree view
  ];
}
