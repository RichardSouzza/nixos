let
  luaCmd = cmd: "function() ${cmd} end";
  vimCmd = cmd: "function() vim.cmd('${cmd}') end";

in
{
  programs.nixvim = {
    plugins = {
      neo-tree = {
        enable = true;
        settings = {
          filesystem = {
            enable_refresh_on_write = true;
            follow_current_file.enabled = true;
            window.mappings = {
              "c".__raw    = luaCmd "Snacks.picker.grep({ regex = false })";
              "e".__raw    = vimCmd "wincmd l";
              "f".__raw    = luaCmd "Snacks.picker.files({ hidden = true })";
              "/".__raw    = luaCmd "Snacks.picker.files({ hidden = true })";
              "<A-up>"     = "close_node";
              "<A-S-up>"   = "close_all_nodes";
              "<A-down>"   = "expand_all_subnodes";
              "<A-S-down>" = "expand_all_nodes";
            };
          };
        };
      };

      web-devicons.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "e";
        action = "<CMD>Neotree focus<CR>";
        options = {
          desc = "Focus on tree view.";
        };
      }
      {
        mode = "n";
        key = "<S-e>";
        action = "<CMD>Neotree toggle<CR>";
        options = {
          desc = "Toggle tree view.";
        };
      }
    ];
  };
}
