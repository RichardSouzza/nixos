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
      action = "<Esc>ldwi";
      options = {
        silent = true;
        desc = "Delete word ahead of the cursor";
      };
    }
    {
      mode = "i";
      key = "<C-kDel>";
      action = "<Esc>ldwi";
      options = {
        silent = true;
        desc = "Delete word ahead of the cursor";
      };
    }
  ];
}
