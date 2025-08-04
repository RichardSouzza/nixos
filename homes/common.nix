{ config, inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./shared/git
    ./shared/nixvim
    ./shared/zsh
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
