{
  programs.nixvim.keymaps = [
    {
      mode = "v";
      key = "<S-A-up>";
      action = "<CMD>'<,'>t'<-1<CR>";
      options = {
        silent = true;
        desc = "Duplicate selection up.";
      };
    }
    {
      mode = "v";
      key = "<S-A-down>";
      action = "<CMD>'<,'>t'><CR>";
      options = {
        silent = true;
        desc = "Duplicate selection down.";
      };
    }
  ];
}
