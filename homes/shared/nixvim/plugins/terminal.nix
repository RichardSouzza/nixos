{
  programs.nixvim = {
    plugins = {
      toggleterm = {
        enable = true;
        settings = {
          size = ''
            function(term)
              if term.direction == "horizontal" then
                return 16
              elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
              end
            end
          '';
        };
      };
    };

    keymaps = [
      {
        action = "<CMD>ToggleTerm direction=horizontal<CR>";
        key = "<A-;>";
        mode = "n";
        options = {
          desc = "Toggle terminal";
        };
      }
      {
        action = "<CMD>ToggleTerm direction=float<CR>";
        key = "<A-j>";
        mode = "n";
        options = {
          desc = "Toggle float terminal";
        };
      }
      {
        action = "<CMD>TermNew<CR>";
        key = "<A-:>";
        mode = "n";
        options = {
          desc = "Open new terminal";
        };
      }
      {
        action = "<CMD>TermSelect<CR>";
        key = ";";
        mode = "n";
        options = {
          desc = "Switch terminal";
        };
      }
      {
        action = ''<C-\><C-n><C-w><C-p>'';
        key = "<C-q>";
        mode = "t";
        options = {
          desc = "Exit terminal mode and go to the previous buffer";
        };
      }
      {
        action = ''<C-\><C-n><C-w><C-p>'';
        key = "<A-;>";
        mode = "t";
        options = {
          desc = "Exit terminal mode and go to the previous buffer";
        };
      }
    ];
  };
}
