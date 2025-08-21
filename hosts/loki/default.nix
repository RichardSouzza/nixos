{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./../common.nix
      ./../shared.nix
      ./../../modules/hyprland
      ./../../modules/nvidia
      ./hardware-configuration.nix
    ];

  # Configure LUKS encryption.
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/92aaebc1-b40b-44bc-aca7-0d7e2a03a274";
      preLVM = true;
    };
  };

  # Configure hostname.
  networking.hostName = "loki";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

  # Configure keymap in X11.
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.model = "pc105";

  # Enable Bluetooth.
  hardware.bluetooth.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Message-oriented middleware.
  services.dbus.enable = true;

  # Permission manager.
  security.polkit.enable = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion.
  system.stateVersion = "24.11"; # Did you read the comment?
}
