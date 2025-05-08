{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-q>";
      action = ":qa<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Exit NeoVim";
      };
    }
    {
      mode = "n";
      key = "<C-s>";
      action = ":w<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Save file";
      };
    }
    {
      mode = "n";
      key = "<C-c>";
      action = "\"+yy";
      options = {
        noremap = true;
        silent = true;
        desc = "Copy line to clipboard";
      };
    }
    {
      mode = "v";
      key = "<C-c>";
      action = "\"+y";
      options = {
        noremap = true;
        silent = true;
        desc = "Copy selected text to clipboard";
      };
    }
    {
      mode = "n";
      key = "<A-up>";
      action = ":m .-2<CR>==";
      options = {
        noremap = true;
        silent = true;
        desc = "Move line up";
      };
    }
    {
      mode = "n";
      key = "<A-down>";
      action = ":m .+1<CR>==";
      options = {
        noremap = true;
        silent = true;
        desc = "Move line down";
      };
    }
    {
      mode = "v";
      key = "<A-down>";
      action = ":m '>-2<CR>gv=gv";
      options = {
        noremap = true;
        silent = true;
        desc = "Move selected line up";
      };
    }
    {
      mode = "v";
      key = "<A-down>";
      action = ":m '>+1<CR>gv=gv";
      options = {
        noremap = true;
        silent = true;
        desc = "Move selected line down";
      };
    }
  ];
}
