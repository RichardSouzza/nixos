{
  imports = [
    ./languages
    ./dashboard.nix
    ./editor.nix
    ./fileExplorer.nix
    ./statusline.nix
    ./tabline.nix
    ./theme.nix
    ./utils.nix
  ];

  programs.nixvim.plugins.snacks.enable = true;
}
