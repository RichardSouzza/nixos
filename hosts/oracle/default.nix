{ config, inputs, lib, pkgs, ... }:

{
  imports =
    [
      ../common
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Configure hostname.
  networking.hostName = "oracle";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

  # Configure keymap in X11.
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.model = "pc105";

  # Message-oriented middleware.
  services.dbus.enable = true;

  # Permission manager.
  security.polkit.enable = true;

  # Configure programs.
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    waybar.enable = true;

    zsh.enable = true;
  };

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  environment.systemPackages = with pkgs; [
    dunst
    fastfetch
    gh git
    gtk4
    hyprland
    hyprpaper
    kitty
    librewolf
    light
    nautilus
    neovim
    nwg-look
    swayosd
    tree
    waybar
    wl-clipboard
    wofi
    yazi
  ];

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

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
  system.stateVersion = "24.11"; # Did you read the comment?

}
