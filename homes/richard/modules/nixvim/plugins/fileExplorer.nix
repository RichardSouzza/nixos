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
        action = "<cmd>tabnext<CR>";
        key = "<C-tab";
        mode = "n";
        options = {
          desc = "Focus on tree view.";
        };
      }
      {
        action = "<cmd>tabprevious<CR>";
        key = "<C-tab";
        mode = "n";
        options = {
          desc = "Focus on tree view.";
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
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<S-e>";
        mode = "n";
        options = {
          desc = "Toggle tree view.";
        };
      }
    ];
  };
}
