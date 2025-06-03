{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/git
    ./modules/hyprland
    ./modules/kitty
    ./modules/nixvim
    ./modules/zsh
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";
  home.stateVersion = "24.11";
  
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs // inputs; [
    ansible
    dbeaver-bin
    discord
    docker docker-compose lazydocker
    gh gitnr lazygit
    gtt
    jdk21_headless
    libqalculate
    nodejs_23
    obs-studio
    onlyoffice-desktopeditors
    openssl
    python311Full
    smile
    systemctl-tui
    television
    wiper
    zen-browser.packages."${system}".default
  ];

  programs = {
    home-manager.enable = true;

    btop = {
      enable = true;
      settings = {
        color_theme = "adapta";
        update_ms = 100;
      };
    };

    waybar.enable = true;    

    yazi.settings = {
      manager = {
        show_hidden = true;
      };
    };
  };
}
