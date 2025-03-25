{ config, inputs, lib, pkgs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure network.
  # networking.wireless.enable = true;      # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Extra Options, like Flakes.
  nix.extraOptions = "
    experimental-features = nix-command flakes
  ";

  # Time zone.
  time.timeZone = "America/Maceio";

  # Internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
    font = "ter-v14n";
    keyMap = "br-abnt2";
    packages = with pkgs; [
      terminus_font
    ];
  };

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable Flatpak.
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy= [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Enable Docker daemon
  virtualisation.docker.enable = true;

  # Groups and users.
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

  nix.settings = {
    allowed-users = [ "@wheel" ];
    trusted-users = [ "@wheel" ];
  };

  system.activationScripts = {
    text = ''
      chown -R :nixers /etc/nixos
      chmod -R 770 /etc/nixos
    '';
  };

  # Configure programs.
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    brightnessctl
    fastfetch
    gh git gitui
    kitty
    librewolf
    nautilus
    neovim
    tree
    yazi
  ];

  environment.etc = {
    "gitconfig".source = ../../homes/root/modules/git/gitconfig;
  };
}
