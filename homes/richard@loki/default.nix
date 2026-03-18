{ pkgs, ... }:

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
    ../shared/zen-browser
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";
  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    bluetui bluetuith
    dbeaver-bin
    docker docker-compose lazydocker
    obs-studio
    openssl
    smile
    systemctl-tui
    television
    wiper
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

    yazi.settings = {
      manager = {
        show_hidden = true;
      };
    };
  };
}
