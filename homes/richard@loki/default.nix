{ pkgs, inputs, ... }:

let
  pkgsUnstable = import <nixpkgs> {};

in
{
  imports = [
    ../common.nix
    ../shared/dunst
    ../shared/hyprland
    ../shared/kitty
    ../shared/walker
    ../shared/waybar
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
    nodejs_24
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
