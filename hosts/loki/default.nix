{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common.nix
    ../../modules/system/core/boot
    ../../modules/system/hardware/bluetooth
    ../../modules/system/hardware/nvidia
    ../../modules/system/packages/fonts
    ../../modules/system/programs/hyprland
    ../../modules/system/services/dbus
    ../../modules/system/services/docker
    ../../modules/system/services/flatpak
    ../../modules/system/services/gdm
    ../../modules/system/services/keyd
    ../../modules/system/services/libinput
    ../../modules/system/services/networkmanager
    ../../modules/system/services/pipewire
    ../../modules/system/services/polkit
    ../../modules/system/services/tlp
    ../../modules/system/services/xserver
  ];

  # Configure LUKS encryption.
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/11182106-3f53-4153-84ab-167615beb2e6";
    };
  };

  # Configure hostname.
  networking.hostName = "loki";

  # Install and configure programs
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
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
