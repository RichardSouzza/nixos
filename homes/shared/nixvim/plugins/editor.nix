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
      nvim-autopairs = {
        enable = true;
        settings = {
          fast_wrap.chars = [ "{" "[" "(" "\"" "'" "`"  "─" ];
        };
      };

      spider = {
        enable = true;
        settings = {
          customPatterns = {
            patterns = [ ";" "%(" "%)$" "\\n$" ];
            overrideDefault = false;
          };
        };
      };

      trim.enable = true;

      ts-autotag.enable = true;

      visual-multi = {
        enable = true;
        settings = {
          default_mappings = 0;
          leader = "\\";
          maps = {
            "Add Cursor At Pos"    = "mp";
            "Add Cursor Up"        = "<C-Up>";
            "Add Cursor Down"      = "<C-Down>";
            "Align"                = "<A-a>";
            "Case Conversion Menu" = "<A-c>";
            "Find Under"           = "<C-n>";
            "Move Left"            = "<A-Left>";
            "Move Right"           = "<A-Right>";
            "Start Regex Search"   = "mr";
            "Select All"           = "ma";
          };
          mouse_mappings = 1;
          show_warnings = 1;
          skip_shorter_lines = 0;
          silent_exit = 1;
          theme = "iceblue";
        };
      };

      # windsurf-nvim = {
      #   enable = true;
      #   settings = {
      #     enable_chat = true;
      #   };
      # };
    };

    extraConfigLua = ''
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")

      npairs.add_rules {
        Rule("{", "};", "nix")
          :with_pair(function(opts)
            return true
          end)
      }

      require("visual-surround").setup({
          use_default_keymaps = true,
          surround_chars = { "{", "}", "[", "]", "(", ")", "'", '"', "`", "*", "_", "─", "~" },
          enable_wrapped_deletion = true,
          exit_visual_mode = true,
      })
    '';

    extraPlugins = [
      (buildVimPlugin {
        name = "visual-surround";
        src = fetchFromGitHub {
          owner = "NStefan002";
          repo = "visual-surround.nvim";
          rev = "v1.0.1";
          hash = "sha256-R1IuhysQODTJtJYETsWk/23/EWud7hphVM5ufKVUowU=";
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
