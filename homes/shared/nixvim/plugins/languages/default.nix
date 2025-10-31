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
        autoEnableSources = true;
        settings.sources = [
          { name = "buffer";   }
          { name = "nvim_lsp"; }
          { name = "path";     }
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

      lspsaga = {
        enable = true;
        settings = {
          codeAction = {
            keys = {
              exec = "<CR>";
              quit = [ "<Esc>" "q" ];
            };
          };
          implement.enable = false;
          lightbulb.enable = false;
          symbol_in_winbar.enable = false; # Breadcrumbs
        };
      };

      # refactoring = {
      #   enable = true;
      # };
    };
  };
}
