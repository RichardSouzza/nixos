let
  buffers = [
    "all"
    "Float"
    "FloatBorder"
    "NormalFloat"
    "Pmenu"
  ];
  lualine = [ "lualine" ];
  neotree = [ "CursorLine" ];

in
{
  programs.nixvim = {
    colorschemes = {
      nightfox = {
        enable = true;
        flavor = "carbonfox";
        settings = {
          options.transparent = true;
        };
      };
    };

    plugins = {
      gitsigns.enable = true;

      noice = {
        enable = true;
        settings = {
          cmdline.format = {
            help = {
              pattern = [ "^:%s*he?l?p?%s+" "^:%s*FloatingHelp%s+" ];
            };
          };
        };
      };

      snacks = {
        settings = {
          indent.enabled = true;
        };
      };

      transparent = {
        enable = true;
        settings = {
          exclude_groups = neotree;
          extra_groups = buffers ++ lualine;
        };
      };

      treesitter = {
        enable = true;
        settings = {
          auto_install = false;
          ensure_installed = [
            "astro" "bash" "c_sharp" "css" "csv"
            "html" "hyprlang" "ini" "java" "javascript"
            "jinja" "jinja_inline" "json" "nix" "python"
            "scss" "sql" "toml" "typescript"
            "tsx" "xml" "yaml"
            # Failed to build:
            # "dockerfile" "lua" "markdown"
            # "markdown_inline" "razor"
          ];
          highlight.enable = true;
          indent.enable = true;
        };
      };
    };
  };
}
