{ config, pkgs, ... }:

{
  gtt = {
    enable = true;
    keymap = ./keymap.yaml;
    theme = ./theme.yaml;
  };
}
