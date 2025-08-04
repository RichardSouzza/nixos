{ config, pkgs, inputs, ... }:

let
  pkgsUnstable = import <nixpkgs-unstable> {};

in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../shared/git
    ../shared/nixvim
    ../shared/zsh
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";
  home.stateVersion = "25.05";
  
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    gh gitnr lazygit
    gtt
    jdk21_headless
    libqalculate
    nodejs_23
    python311Full
    systemctl-tui
    television
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
