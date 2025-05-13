{
  imports = [
    ./python.nix
    ./typescript.nix
  ];

  programs.nixvim.plugins = {
    cmp.enable = true;

    lsp = {
      enable = true;
      autoLoad = true;
      inlayHints = true;
    };
  };
}
