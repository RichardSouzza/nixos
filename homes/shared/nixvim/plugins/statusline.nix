let
  breadcrumbs = {
    __raw = ''
      function()
        return require('lspsaga.symbol.winbar').get_bar()
      end
    '';
  };
  isNeoTree = {
    __raw = ''
      function()
        return vim.bo.filetype == 'neo-tree'
      end
    '';
  };
  isNotNeoTree = {
    __raw = ''
      function()
        return vim.bo.filetype ~= 'neo-tree'
      end
    '';
  };

in
{
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;

        settings = {
          sections = {
            lualine_a = [
              { __unkeyed-1 = "mode"; cond = isNotNeoTree; }
            ];

            lualine_b = [
              { __unkeyed-1 = "branch";      cond = isNotNeoTree; }
              { __unkeyed-1 = "diff";        cond = isNotNeoTree; }
              { __unkeyed-1 = "diagnostics"; cond = isNotNeoTree; }
            ];

            lualine_c = [
              { __unkeyed-1 = "branch";   cond = isNeoTree;    }
              { __unkeyed-1 = breadcrumbs; cond = isNotNeoTree; }
            ];

            lualine_x = [
              { __unkeyed-1 = "location"; cond = isNeoTree;    }
              { __unkeyed-1 = "encoding"; cond = isNotNeoTree; }
            ];

            lualine_y = [
              { __unkeyed-1 = "filetype";   cond = isNotNeoTree; }
              { __unkeyed-1 = "lsp_status"; cond = isNotNeoTree; }
            ];

            lualine_z = [
              { __unkeyed-1 = "location"; cond = isNotNeoTree; }
            ];
          };

          inactive_sections = {
            lualine_c = [
              { __unkeyed-1 = "filename"; cond = isNotNeoTree; }
            ];

            lualine_x = [
              { __unkeyed-1 = "location"; cond = isNotNeoTree; }
            ];
          };
        };
      };
    };
  };
}
