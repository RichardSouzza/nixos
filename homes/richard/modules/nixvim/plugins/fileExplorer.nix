{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
      };

      web-devicons.enable = true;
    };

    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<C-b>";
        mode = "n";
        options = {
        desc = "Toggle tree view.";
        };
      }
      {
        action = "<cmd>Neotree focus<CR>";
        key = "e";
        mode = "n";
        options = {
        desc = "Focus on tree view.";
        };
      }
    ];
  };
}
