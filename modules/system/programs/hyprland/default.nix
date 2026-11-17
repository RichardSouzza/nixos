{ pkgs, ... }:

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
    gtk4
    hyprpaper
    hyprpicker
    nwg-look
    wl-clipboard
  ];
}
