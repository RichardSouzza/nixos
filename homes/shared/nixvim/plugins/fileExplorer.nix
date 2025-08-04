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
        action = "<CMD>Neotree focus<CR>";
        key = "e";
        mode = "n";
        options = {
          desc = "Focus on tree view.";
        };
      }
      {
        action = "<CMD>Neotree toggle<CR>";
        key = "<S-e>";
        mode = "n";
        options = {
          desc = "Toggle tree view.";
        };
      }
    ];
  };
}
