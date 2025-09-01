{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-q>";
      action = ":qa<CR>";
      options = {
        silent = true;
        desc = "Exit NeoVim";
      };
    }
    {
      mode = "n";
      key = "<C-s>";
      action = ":w<CR>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }
    {
      mode = "n";
      key = "<C-c>";
      action = "\"+yy";
      options = {
        silent = true;
        desc = "Copy line to clipboard";
      };
    }
    {
      mode = "n";
      key = "<A-up>";
      action = ":m .-2<CR>==";
      options = {
        silent = true;
        desc = "Move line up";
      };
    }
    {
      mode = "n";
      key = "<A-down>";
      action = ":m .+1<CR>==";
      options = {
        silent = true;
        desc = "Move line down";
      };
    }
    {
      mode = "n";
      key = "<S-A-up>";
      action = "<CMD>t. -1<CR>";
      options = {
        silent = true;
        desc = "Duplicate line up.";
      };
    }
    {
      mode = "n";
      key = "<S-A-down>";
      action = "<CMD>t.<CR>";
      options = {
        silent = true;
        desc = "Duplicate line down.";
      };
    }
  ];
}
