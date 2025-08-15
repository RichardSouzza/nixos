{
  imports = [
    ./languages
    ./dashboard.nix
    ./fileExplorer.nix
    ./statusline.nix
    ./tabline.nix
    ./theme.nix
    ./utils.nix
  ];

  programs.nixvim.plugins.snacks.enable = true;
}
