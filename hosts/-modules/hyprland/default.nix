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
    dunst
    gtk4
    hyprland
    hyprpaper
    light
    nwg-look
    swayosd
    waybar
    wl-clipboard
    wofi
  ];
}
