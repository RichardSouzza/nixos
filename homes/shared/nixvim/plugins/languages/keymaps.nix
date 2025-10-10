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
        action = "function() vim.lsp.buf.declaration() end";
        options = {
          desc = "Go to declaration";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gD";
        lua = true;
        action = "function() vim.lsp.buf.definition() end";
        options = {
          desc = "Go to definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gt";
        lua = true;
        action = "function() vim.lsp.buf.type_definition() end";
        options = {
          desc = "Go to type definition";
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
