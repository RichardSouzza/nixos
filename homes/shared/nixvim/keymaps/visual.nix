{
  programs.nixvim.keymaps = [
    {
      mode = "v";
      key = "<C-c>";
      action = "\"+y";
      options = {
        silent = true;
        desc = "Copy selected text to clipboard";
      };
    }
    {
      mode = "v";
      key = "<C-s>";
      action = "<Esc>:w<CR>";
      options = {
        desc = "Save file";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<A-up>";
      action = ":m '<-2<CR>gv=gv";
      options = {
        desc = "Move selected lines up";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<A-down>";
      action = ":m '>+1<CR>gv=gv";
      options = {
        desc = "Move selected lines down";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<S-A-up>";
      action = ":copy .-1<CR>^";
      options = {
        desc = "Duplicate selection up";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<S-A-down>";
      action = ":copy .<CR>^";
      options = {
        desc = "Duplicate selection down";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<A-/>";
      action = "gc";
      options = {
        desc = "Comment line";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        desc = "Unindent while keeping selection";
        silent = true;
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        desc = "Indent while keeping selection";
        silent = true;
      };
    }
  ];
}
