{
  imports = [
    ./python.nix
    ./typescript.nix
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
        autoLoad = true;
        inlayHints = true;
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
