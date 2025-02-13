# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, inputs, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  nix.extraOptions = "
    experimental-features = nix-command flakes
  ";

  # Set your time zone.
  time.timeZone = "America/Maceio";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
    font = "ter-v14n";
    keyMap = "br-abnt2";
    packages = with pkgs; [
      terminus_font
    ];
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  # services.xserver.displayManager.sddm.theme = "";

  # Configure keymap in X11
  services.xserver.xkb.layout = "br";
  services.xserver.xkb.model = "pc105";

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Message-oriented middleware
  services.dbus.enable = true;

  # Permission manager
  security.polkit.enable = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.richard = {
    isNormalUser = true;
    home = "/home/richard";
    description = "Richard";
    extraGroups = [ "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "richard" = import ./home.nix;
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    dolphin
    dunst
    fastfetch
    firefox
    gh git
    hyprland
    hyprpaper
    kitty
    light
    neovim
    nwg-look
    ranger
    waybar
    wl-clipboard
    wofi
  ];

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

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

