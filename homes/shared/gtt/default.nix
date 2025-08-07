{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ gtt ];

  home.file.".config/gtt/keymap.yaml".source = ./keymap.yaml;
  home.file.".config/gtt/theme.yaml".source = ./theme.yaml;
}
