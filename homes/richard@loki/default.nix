{ pkgs, ... }:

let
  # pkgsUnstable = import <nixpkgs> {};

in
{
  imports = [
    ../common.nix
    ../shared/dunst
    ../shared/hyprland
    ../shared/kitty
    ../shared/rider
    ../shared/walker
    ../shared/waybar
    ../shared/zen-browser
  ];

  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  # ======================================================
  # Pkg Name                          # Description
  # ===== Applications ===================================
    dbeaver-bin                       # Database client
    hoppscotch                        # API tester
    localsend                         # File sharing
    opencode-desktop                  # Code agent
    smile                             # Emoji picker
  # ===== TUIs ===========================================
    bluetui bluetuith                 # Bluetooth TUI
    docker docker-compose lazydocker  # Docker
    systemctl-tui                     # Systemctl TUI
  # ===== Utils ==========================================
    gromit-mpx                        # Screen annotation
    ripdrag                           # Drag and drop
  # ===== Temp =;=========================================
    dart
    openjdk8
    android-studio
  ];
}
