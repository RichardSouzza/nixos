{ config, pkgs, ... }:

{
  home.username = "richard";
  home.homeDirectory = "/home/richard";
  home.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    docker
    jdk21_headless
    nodejs_23
    python313Full
    vscode
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

    librewolf = {
      enable = true;
      languagePacks = [ "pt-BR" "us"];
    };

    vscode.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "Josefin Sans";
      size = 8;
    };
  };

  home.file = {
    ".config/hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;
    ".local/share/nwg-look/gsettings".source = ./dotfiles/gsettings;
  };
}
