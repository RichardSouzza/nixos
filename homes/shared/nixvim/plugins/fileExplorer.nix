{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;

        filesystem = {
          followCurrentFile.enabled = true;
          window.mappings = {
            "e".__raw = "function() vim.cmd('wincmd l') end";
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
      {
        action = "<CMD>Neotree expand_all_nodes<CR>";
        key = "<S-plus>";
        mode = "n";
        options = {
          desc = "Expand all directory nodes in the tree recursively";
        };
      }
      {
        action = "<CMD>Neotree expand_all_subnodes<CR>";
        key = "plus";
        mode = "n";
        options = {
          desc = "Expand recursively all directory in the node.";
        };
      }
      {
        action = "<CMD>Neotree close_all_nodes<CR>";
        key = "<S-minus>";
        mode = "n";
        options = {
          desc = "Close all nodes in the tree.";
        };
      }
      {
        action = "<CMD>Neotree close_node<CR>";
        key = "minus";
        mode = "n";
        options = {
          desc = "Close node if it is open, else close it's parent.";
        };
      }
    ];
  };
}
