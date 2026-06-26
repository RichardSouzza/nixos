{ pkgs, ... }:

{
  imports = [
    ../common.nix
  ];

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    charasay
    codesearch
    flutter
    glab
  ];
}
