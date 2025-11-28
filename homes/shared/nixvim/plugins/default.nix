{ pkgs, ... }:

{
  imports = [
    ./languages
    ./dashboard.nix
    ./editor.nix
    ./fileExplorer.nix
    ./statusline.nix
    ./tabline.nix
    ./terminal.nix
    ./theme.nix
    ./utils.nix
  ];

  programs.nixvim.plugins = {
    snacks.enable = true;
  };
}
