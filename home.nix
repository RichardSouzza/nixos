{ config, pkgs, ... }:

{
  home.username = "richard";
  home.homeDirectory = "/home/richard";
  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.docker
    pkgs.jdk21_headless
    pkgs.nodejs_23
    pkgs.python313Full
    pkgs.vscode
  ];

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "Richard Souza";
      userEmail = "souzza.richard25@gmail.com";
    };

    kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = 0;
        background_opacity = 0.5;
	font_size = 8;
        font_name = "JetBrainsMono Nerd Font";
      };
    };

    vscode.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
    };
  };

  home.file = {
    "~/.config/hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;
  };
}
