{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/git
    ./modules/hyprland
    ./modules/nixvim
    ./modules/zsh
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";
  home.stateVersion = "24.11";
  
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    docker
    jdk21_headless
    lazydocker
    nodejs_23
    python313Full
    vscode
  ];

  programs = {
    home-manager.enable = true;

    btop = {
      enable = true;
      settings = {
        color_theme = "adapta";
        update_ms = 100;
      };
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
      settings = {
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.cookies" = false;
      };
    };

    vscode.enable = true;

    waybar.enable = true;    

    yazi.settings = {
      manager = {
        show_hidden = true;
      };
    };

  };
}
