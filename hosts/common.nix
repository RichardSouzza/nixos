{ config, inputs, lib, pkgs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
    ];

  nix.extraOptions = "
    experimental-features = nix-command flakes
  ";

  nix.settings = {
    allowed-users = [ "@wheel" ];
    trusted-users = [ "@wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    zsh.enable = true;
  };

  environment.etc = {
    "gitconfig".source = ../homes/root/modules/git/gitconfig;
  };
}
