{ config, pkgs, ... }:

{
  imports = [
    ../common.nix
  ];

  home.stateVersion = "25.05";

  home.packages = with pkgs; [ ];
}
