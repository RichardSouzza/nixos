{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;

        filesystem = {
          followCurrentFile.enabled = true;
          window.mappings = {
            "e".__raw = "function() vim.cmd('wincmd p') end";
          };
        };
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
