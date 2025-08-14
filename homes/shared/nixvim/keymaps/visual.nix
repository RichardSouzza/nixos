{
  programs.nixvim.keymaps = [
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
      mode = "v";
      key = "<A-up>";
      action = ":m '<-2<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move selected lines up";
      };
    }
    {
      mode = "v";
      key = "<A-down>";
      action = ":m '>+1<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move selected lines down";
      };
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        silent = true;
        desc = "Unindent while keeping selection";
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        silent = true;
        desc = "Indent while keeping selectio";
      };
    }
  ];
}
