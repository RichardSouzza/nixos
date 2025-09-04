{ config, inputs, lib, pkgs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
    ];

  nix.settings = {
    allowed-users = [ "@wheel" ];
    trusted-users = [ "@wheel" ];
    experimental-features = "flakes nix-command pipe-operators";
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
      source /etc/nixos/hosts/activation.sh
    '';
  };

  environment.systemPackages = with pkgs; [
    git jq
    neovim
  ];

  programs.zsh.enable = true;

  environment.etc = {
    "gitconfig".source = ../modules/git/gitconfig;
  };
}
