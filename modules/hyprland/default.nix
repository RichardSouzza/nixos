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
    grimblast
    gtk4
    hyprland
    hyprpaper
    hyprpicker
    nwg-look
    wl-clipboard
  ];
}
