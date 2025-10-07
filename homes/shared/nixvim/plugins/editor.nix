{ pkgs, ... }:

let
  inherit
    (pkgs) fetchFromGitHub;
  inherit
    (pkgs.vimUtils) buildVimPlugin;

in
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

      visual-multi = {
        enable = true;
        settings = {
          default_mappings = 0;
          maps = {
            "Add Cursor Up"        = "<C-Up>";
            "Add Cursor Down"      = "<C-Down>";
            "Align"                = "<A-a>";
            "Case Conversion Menu" = "<A-c>";
            "Find Prev"            = "<C-[>";
            "Find Under"           = "<C-]>";
            "Move Left"            = "<A-Left>";
            "Move Right"           = "<A-Right>";
          };
          mouse_mappings = 1;
          show_warnings = 1;
          silent_exit = 0;
        };
      };
    };

    extraPlugins = [
      (buildVimPlugin {
        name = "duplicate";
        src = fetchFromGitHub {
          owner = "hinell";
          repo = "duplicate.nvim";
          rev = "v1.1.0";
          hash = "sha256-k3Q7mk04dd2yql4NK5Lrm/AEy3lWp0xV2qvxqVly3lg=";
        };
      })
    ];

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
