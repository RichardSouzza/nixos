{ pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure network
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "America/Maceio";

  # Internationalisation properties
  i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
    font = "ter-v14n";
    keyMap = "br-abnt2";
    packages = with pkgs; [
      terminus_font
    ];
  };

  # Add fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    texlivePackages.josefin
  ];

  # Enable sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable battery saver
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      START_CHARGE_THRESH_BAT0 = 70;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  # Enable Flatpak
  # services.flatpak.enable = true;
  #
  # systemd.services.flatpak-repo = {
  #   wantedBy= [ "multi-user.target" ];
  #   path = [ pkgs.flatpak ];
  #   script = ''
  #     flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  #   '';
  # };

  # Enable Docker daemon
  virtualisation.docker.enable = true;

  # Install shared programs
  programs = {
    nix-ld.enable = true; # Unpatched binaries runner
    nix-ld.libraries = [];
  };

  environment.systemPackages = with pkgs; [
    brightnessctl # Brightness controller
    btop          # Resource monitor
    kitty         # Feline terminal
    nautilus      # Gnome files
  ];

  environment.extraInit = ''
    unset -v SSH_ASKPASS
  '';

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
