{ config, inputs, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure network.
  # networking.wireless.enable = true;      # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

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

  # Fonts.
  fonts.packages = with pkgs; [
    texlivePackages.josefin
  ];

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable battery saver.
  services.tlp.enable = true;

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

  # Install shared programs.
  environment.systemPackages = with pkgs; [
    brightnessctl
    btop
    fastfetch
    git
    kitty
    librewolf
    lshw
    nautilus
    neovim
    superfile
    tree
    yazi
  ];

  environment.extraInit = ''
    unset -v SSH_ASKPASS
  '';

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
