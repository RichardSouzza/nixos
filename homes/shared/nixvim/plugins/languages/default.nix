{ pkgs, ... }:

{
  imports = [
    ./markdown.nix
    ./nix.nix
    ./python.nix
    ./typescript.nix
  ];

  home.packages = with pkgs; [
    efm-langserver
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

      lsp.servers.efm = {
        enable = true;

        extraOptions.init_options = {
          documentFormatting = true;
          documentRangeFormatting = true;
          hover = true;
          documentSymbol = true;
          codeAction = true;
          completion = true;
        };
      };

      efmls-configs.enable = true;

      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };
    };

    keymaps = [
      {
        mode = "i";
        key = "<A-Left>";
        lua = true;
        action = ''
          function()
            local cmp = require("cmp")
            if cmp.visible() then
              cmp.select_prev_item()
            else
              cmp.complete()
            end
          end
        '';
        options = {
          noremap = true;
          silent = true;
          desc = "Previous CMP suggestion";
        };
      }
      {
        mode = "i";
        key = "<A-Right>";
        lua = true;
        action = ''
          function()
            local cmp = require("cmp")
            if cmp.visible() then
              cmp.select_next_item()
            else
              cmp.complete()
            end
          end
        '';
        options = {
          noremap = true;
          silent = true;
          desc = "Next CMP suggestion";
        };
      }
    ];
  };
}
