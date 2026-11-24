{ pkgs, ... }:

let
  # pkgsUnstable = import <nixpkgs> {};

in
{
  imports = [
    ../../modules/home/apps/rider
    ../../modules/home/apps/zen-browser
    ../../modules/home/system/dunst
    ../../modules/home/system/hyprland
    ../../modules/home/system/kitty
    ../../modules/home/system/walker
    ../../modules/home/system/waybar
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
    ripdrag                           # Drag and drop
  # ===== Temp =;=========================================
    android-studio
  ];
}
