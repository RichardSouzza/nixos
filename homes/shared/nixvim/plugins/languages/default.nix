{
  imports = [
    ./formatters.nix
    ./keymaps.nix
    ./servers.nix
    ./utils.nix
  ];

  programs.nixvim = {
    plugins = {

      blink-cmp = {
        enable = true;

        settings = {
          completion = {
            list = {
              selection = {
                preselect = false;
              };
            };
          };

          keymap = {
            preset = "none";
            "<A-Left>" = [ "select_prev" "fallback" ];
            "<A-Right>" = [ "select_next" "fallback" ];
          };

          signature = {
            enabled = true;
          };

          sources = {
            default = [
              "buffer"
              "dictionary"
              "emoji"
              "lsp"
              "path"
              "ripgrep"
              "snippets"
            ];

            providers = {
              buffer = {
                score_offset = 1;
              };

              dictionary = {
                name = "Dict";
                module = "blink-cmp-dictionary";
                min_keyword_length = 3;
                score_offset = 4;
              };

              emoji = {
                name = "Emoji";
                module = "blink-emoji";
                score_offset = 10;
                opts = {
                  insert = true;
                };
              };

              lsp = {
                fallbacks = [ ];
                score_offset = 3;
              };

              path = {
                min_keyword_length = 2;
                score_offset = 2;
              };

              ripgrep = {
                async = true;
                name = "Ripgrep";
                module = "blink-ripgrep";
                score_offset = 3;
                opts = {
                  prefix_min_len = 3;
                  backend = {
                    context_size = 5;
                    max_filesize = "2M";
                    search_casing = "--smart-case";
                  };
                };
              };
            };
          };
        };
      };

      blink-cmp-dictionary.enable = true;
      blink-emoji.enable = true;
      blink-ripgrep.enable = true;

      lsp = {
        enable = true;
        inlayHints = true;
      };

      lspsaga = {
        enable = true;
        settings = {
          codeAction = {
            keys = {
              exec = "<CR>";
              quit = [ "<Esc>" "q" ];
            };
          };
          implement.enable = false;
          lightbulb.enable = false;
          symbol_in_winbar.enable = false; # Breadcrumbs
        };
      };
    };
  };
}
