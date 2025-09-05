let
  vimCmd = cmd: "function() vim.cmd('${cmd}') end";

in
{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;

        filesystem = {
          followCurrentFile.enabled = true;
          window.mappings = {
            "e".__raw  = vimCmd "wincmd l";
            "<S-up>"   = "close_node";
            "<A-up>"   = "close_all_nodes";
            "<S-down>" = "expand_all_subnodes";
            "<A-down>" = "expand_all_nodes";
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
