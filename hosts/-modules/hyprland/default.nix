{ config, inputs, lib, pkgs, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    waybar.enable = true;
  };

  environment.systemPackages = with pkgs; [
    clipse
    dunst
    gtk4
    hyprland
    hyprpaper
    light
    nwg-look
    walker
    waybar
  ];
}
