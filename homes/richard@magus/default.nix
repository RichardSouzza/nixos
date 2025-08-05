{ config, inputs, pkgs, ... }:

let
  pkgsUnstable = import <nixpkgs-unstable> {};

in
{
  imports = [
    ../common.nix
  ];

  home.stateVersion = "25.05";

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
}
