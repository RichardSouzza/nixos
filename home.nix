{ config, pkgs, ... }

{
  home = {
    username = "richard";
    homeDirectory = "/home/richard";
    stateVersion = "24.11";

    packages = with pkgs = [
      jdk21_headless
      vscode
    ];
  };

  programs = {
    home-manager.enable = true;

    kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = 0;
        dynamic_background_opacity = true;
        font_size = 8;
      };
    };

    vscode.enable = true;
  };

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.variables = [~ --all~];
}
