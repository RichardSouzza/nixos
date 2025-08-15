{
  programs.nixvim = {
    plugins = {
      bufferline = {
        enable = true;

        settings = {
          highlights.buffer_selected.italic = false;

          options = {
            offsets = [
              {
                filetype = "neo-tree";
                text = "File Explorer";
                text_align = "center";
                separator = true;
              }
            ];
          };
        };
      };

      snacks.settings.bufdelete.enabled = true;
    };

    keymaps = [
      {
        action = "<CMD>lua Snacks.bufdelete()<CR>";
        key = "<S-w>";
        mode = "n";
        options = {
          desc = "Close buffer";
          silent = true;
        };
      }
      {
        action = "<CMD>BufferLineCycleNext<CR>";
        key = "<S-tab>";
        mode = "n";
        options = {
          desc = "Next buffer";
          silent = true;
        };
      }
      {
        action = "<CMD>BufferLineCyclePrev<CR>";
        key = "<S-A-tab>";
        mode = "n";
        options = {
          desc = "Next buffer";
          silent = true;
        };
      }
    ];
  };
}
