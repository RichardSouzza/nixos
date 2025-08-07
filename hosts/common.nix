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

  users.users.richard = {
    isNormalUser = true;
    home = "/home/richard";
    description = "Richard";
    shell = pkgs.zsh;
  };

  users.groups = {
    docker.members = [ "richard" ];
    nixers.members = [ "richard" ];
    wheel.members  = [ "richard" ];
  };

  system.activationScripts = {
    text = ''
      chown -R :nixers /etc/nixos
      chmod -R 770 /etc/nixos
    '';
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];

  programs.zsh.enable = true;

  environment.etc = {
    "gitconfig".source = ../modules/git/gitconfig;
  };
}
