{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-q>";
      action = ":qa<CR>";
      options = {
        desc = "Exit NeoVim";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-s>";
      action = ":w<CR>";
      options = {
        desc = "Save file";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-c>";
      action = "\"+yy";
      options = {
        desc = "Copy line to clipboard";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-delete>";
      action = "dw";
      options = {
        desc = "Delete word ahead of the cursor";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-/>";
      action = "gcc";
      options = {
        desc = "Comment line";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-[>";
      action = "O";
      options = {
        desc = "New line above";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-]>";
      action = "o";
      options = {
        desc = "New line bellow";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-up>";
      action = ":m .-2<CR>==";
      options = {
        desc = "Move line up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-down>";
      action = ":m .+1<CR>==";
      options = {
        desc = "Move line down";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-A-up>";
      action = "<CMD>t. -1<CR>";
      options = {
        desc = "Duplicate line up";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-A-down>";
      action = "<CMD>t.<CR>";
      options = {
        desc = "Duplicate line down";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-q>";
      action = ":q<CR>";
      options = {
        desc = "Close buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<home>";
      action.__raw = ''
        function()
          local col = vim.fn.col('.')
          local first_non_blank = vim.fn.indent('.')
          if col - 1 == first_non_blank then
            vim.cmd('normal! 0')
          else
            vim.cmd('normal! ^')
          end
        end
      '';
      options = {
        desc = "Switches between line ^ and 0";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<insert>";
      action = "a";
      options = {
        desc = "Append as default insertion mode";
        silent = true;
      };
    }
  ];
}
