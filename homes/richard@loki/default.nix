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
    ../shared/walker
    ../shared/waybar
    ../shared/zen-browser
  ];

  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  # =======================================================
  # Pkg Name                         # Description
  # ===== Applications ====================================
    dbeaver-bin                      # Database client
    hoppscotch                       # API tester
    jetbrains.rider                  # C# IDE
    localsend                        # File sharing
    opencode-desktop                 # Code agent
    smile                            # Emoji picker
  # ===== TUIs ============================================
    bluetui bluetuith                # Bluetooth TUI
    docker docker-compose lazydocker # Docker
    systemctl-tui                    # Systemctl TUI
  # ===== Utils ===========================================
    gromit-mpx                       # Screen annotation
    ripdrag                          # Drag and drop
  # ===== Dev stuff =======================================
    dotnet-sdk_10                    # Dotnet SDK
  ];

  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = "adapta";
        update_ms = 100;
      };
    };
  };
}
