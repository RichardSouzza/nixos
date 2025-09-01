{
  programs.nixvim.keymaps = [
    {
      mode = "i";
      key = "<C-s>";
      action = "<Esc>:w<CR>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }
    {
      mode = "i";
      key = "<C-delete>";
      action = "<C-o>dw";
      options = {
        silent = true;
        desc = "Delete word ahead of the cursor.";
      };
    }
  ];
}
