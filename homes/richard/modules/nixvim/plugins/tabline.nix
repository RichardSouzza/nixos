{
  programs.nixvim = {
    plugins.bufferline = {
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
          }];
        };
      };
    };

    keymaps = [
      {
        action = ":BufferLineCycleNext<CR>";
        key = "<S-tab>";
        mode = "n";
        options = {
          desc = "Next buffer";
        };
      }
      {
        action = ":BufferLineCyclePrev<CR>";
        key = "<S-A-tab>";
        mode = "n";
        options = {
          desc = "Next buffer";
        };
      }
    ];
  };
}
