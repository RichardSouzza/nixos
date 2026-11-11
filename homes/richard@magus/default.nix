{ pkgs, ... }:

{
  imports = [
    ../common.nix
    (../. + "/richard@magus/chezmoi")
    (../. + "/richard@magus/zsh")
  ];

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    codesearch
    chezmoi
  ];
}
