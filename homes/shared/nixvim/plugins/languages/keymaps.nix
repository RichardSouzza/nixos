{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "r";
        lua = true;
        action = "function() vim.lsp.buf.rename() end";
        options = {
          desc = "LSP rename";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gd";
        lua = true;
        action = "function() Snacks.picker.lsp_definitions() end";
        options = {
          desc = "Go to definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gD";
        lua = true;
        action = "function() Snacks.picker.lsp_declarations() end";
        options = {
          desc = "Go to declaration";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gi";
        lua = true;
        action = "function() Snacks.picker.lsp_implementations() end";
        options = {
          desc = "Go to declaration";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gr";
        lua = true;
        action = "function() Snacks.picker.lsp_references() end";
        options = {
          desc = "Go to type definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gt";
        lua = true;
        action = "function() Snacks.picker.lsp_type_definitions() end";
        options = {
          desc = "Go to type definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = ".";
        action = "<CMD>Lspsaga code_action<CR>";
        options = {
          desc = "Show code actions";
          silent = true;
        };
      }
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
          desc = "Previous CMP suggestion";
          silent = true;
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
          desc = "Next CMP suggestion";
          silent = true;
        };
      }
    ];
  };
}
