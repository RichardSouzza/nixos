{ pkgs, ... }:

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

  programs.nixvim.plugins.snacks = {
    enable = true;
    package = pkgs.vimPlugins.snacks-nvim.overrideAttrs (old: {
      postInstall =
        old.postInstall or ""
        + ''
          mkdir --parents $out/after/;
          mv $out/queries/ $out/after/queries/
        '';
    });
  };
}
