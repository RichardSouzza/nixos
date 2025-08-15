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
  ];
}
