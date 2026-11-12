{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    ../modules/system/programs/git
    ../modules/system/programs/zsh
  ];

  # System settings
  nix.settings = {
    allowed-users = [ "@wheel" ];
    trusted-users = [ "@wheel" ];
    experimental-features = [ "flakes" "nix-command" "pipe-operators" ];
  };

  nixpkgs.config.allowUnfree = true;

  # Set time zone
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

  # Configure users
  users.users.richard = {
    isNormalUser = true;
    home = "/home/richard";
    description = "Richard";
    shell = pkgs.zsh;
  };

  users.groups = {
    docker.members = [ "richard" ];
    networkmanager.members = [ "richard" ];
    nixers.members = [ "richard" ];
    wheel.members  = [ "richard" ];
  };

  # Run on every `nixos-rebuild switch`
  system.activationScripts = {
    text = ''
      source /etc/nixos/hosts/activation.sh
    '';
  };

  # Allow the run of unpatched dynamic binaries
  programs = {
    nix-ld.enable = true;
    nix-ld.libraries = [];
  };
}
