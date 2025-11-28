{
  programs.nixvim.keymaps = [
    {
      mode = "i";
      key = "<C-s>";
      action = "<Esc>:w<CR>";
      options = {
        desc = "Save file";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<C-backspace>";
      action = "<Esc>ldbi";
      options = {
        desc = "Delete word behind of the cursor";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<C-delete>";
      action = "<Esc>ldwi";
      options = {
        desc = "Delete word ahead of the cursor";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<C-kDel>";
      action = "<Esc>ldwi";
      options = {
        desc = "Delete word ahead of the cursor";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<C-/>";
      action = "<Esc>gcci";
      options = {
        desc = "Comment line";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<A-[>";
      action = "<Esc>O";
      options = {
        desc = "New line above";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<A-]>";
      action = "<Esc>o";
      options = {
        desc = "New line bellow";
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<home>";
      action.__raw = ''
        function()
          vim.schedule(function()
            local col = vim.fn.col('.')
            local first_non_blank = vim.fn.indent('.') + 1
            if col == first_non_blank then
              vim.cmd('normal! 0')
            else
              vim.cmd('normal! ^')
            end
          end)
        end
      '';
      options = {
        desc = "Switches between line ^ and 0";
        silent = true;
      };
    }
  ];
}
