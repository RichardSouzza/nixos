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

      bufdelete = {
        enable = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<S-tab>";
        action = ":BufferLineCycleNext<CR>";
        options = {
          desc = "Next buffer";
        };
      }
      {
        mode = "n";
        key = "<S-A-tab>";
        action = ":BufferLineCyclePrev<CR>";
        options = {
          desc = "Next buffer";
        };
      }
      {
        mode = "n";
        key = "<S-w>";
        action = ":Bdelete<CR>";
        options = {
          desc = "Close buffer";
        };
      }
    ];
  };
}
