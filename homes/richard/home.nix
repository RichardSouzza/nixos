{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/nixvim
  ];

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

  services = {
    swayosd.enable = true;
  };

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

    waybar.enable = true;    

    yazi.settings = {
      manager = {
        show_hidden = true;
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        c = "clear";
        hms = "home-manager switch --flake /etc/nixos/#richard";
        tree = "tree --dirsfirst --gitignore";
        y = "yazi";
      };
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
    ".config/hypr/hyprland.conf".source = ./modules/hyprland/hyprland.conf;
  };
}
