{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/git
    ./modules/hyprland
    ./modules/kitty
    ./modules/nixvim
    ./modules/zsh
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";
  home.stateVersion = "24.11";
  
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    ansible
    dbeaver-bin
    docker
    jdk21_headless
    nodejs_23
    python313Full
    smile
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
