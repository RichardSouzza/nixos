{ config, inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./shared/btop
    ./shared/git
    ./shared/nixvim
    ./shared/yazi
    ./shared/zsh
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
