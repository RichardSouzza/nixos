{
  programs.nixvim.keymaps = [
    {
      mode = "i";
      key = "<C-s>";
      action = "<Esc>:w<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Save file";
      };
    }
  ];
}
