{ pkgs, inputs, ... }:

let
  pkgsUnstable = import <nixpkgs> {};

in
{
  imports = [
    ../common.nix
    ../shared/btop
    ../shared/dunst
    ../shared/git
    ../shared/gtt
    ../shared/hyprland
    ../shared/kitty
    ../shared/nixvim
    ../shared/starship
    ../shared/waybar
    ../shared/yazi
    ../shared/zsh
    inputs.nixvim.homeManagerModules.nixvim
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
  ] ++ (with pkgsUnstable; [
    posting
  ]);

  programs = {
    home-manager.enable = true;

    btop = {
      enable = true;
      settings = {
        color_theme = "adapta";
        update_ms = 100;
      };
    };

    yazi.settings = {
      manager = {
        show_hidden = true;
      };
    };
  };
}
