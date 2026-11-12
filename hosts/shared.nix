{ pkgs, ... }:

{
  imports = [
    ../modules/system/core/boot
    ../modules/system/hardware/bluetooth
    ../modules/system/packages/fonts
    ../modules/system/services/dbus
    ../modules/system/services/docker
    ../modules/system/services/flatpak
    ../modules/system/services/gdm
    ../modules/system/services/networkmanager
    ../modules/system/services/pipewire
    ../modules/system/services/polkit
    ../modules/system/services/xserver
  ];

  # Install and configure shared programs

  environment.systemPackages = with pkgs; [
    brightnessctl # Brightness controller
    btop          # Resource monitor
    kitty         # Terminal
    nautilus      # Gnome files
  ];

  programs = {
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
