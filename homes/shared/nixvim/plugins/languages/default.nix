{
  imports = [
    ./keymaps.nix
    ./servers.nix
    ./utils.nix
  ];

  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;

        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path";     }
          { name = "buffer";   }
        ];
      };


      lsp = {
        enable = true;
        inlayHints = true;
      };

      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };
    };
  };
}
