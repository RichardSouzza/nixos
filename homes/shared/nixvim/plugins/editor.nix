{
  programs.nixvim = {
    plugins = {
      guess-indent.enable = true;

      spider = {
        enable = true;
        settings = {
          customPatterns = {
            patterns = [ ";" ];
            overrideDefault = false;
          };
        };
      };

      trim.enable = true;
    };

    keymaps = [
      {
        action = "<CMD>lua require('spider').motion('b')<CR>";
        key = "<C-left>";
        mode = "n";
        options = {
          desc = "Go to the beginning of the previous word";
        };
      }
      {
        action = "<CMD>lua require('spider').motion('w')<CR>";
        key = "<C-right>";
        mode = "n";
        options = {
          desc = "Go to the beginning of the next word.";
        };
      }
      {
        action = "<ESC>l<CMD>lua require('spider').motion('b')<CR>i";
        key = "<C-left>";
        mode = "i";
        options = {
          desc = "Go to the beginning of the previous word";
        };
      }
      {
        action = "<ESC>l<CMD>lua require('spider').motion('w')<CR>i";
        key = "<C-right>";
        mode = "i";
        options = {
          desc = "Go to the beginning of the next word.";
        };
      }
    ];
  };
}
