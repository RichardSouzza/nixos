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

  ];
}
