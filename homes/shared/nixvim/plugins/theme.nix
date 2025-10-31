{ pkgs, ... }:

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
      base16 = {
        enable = false;
        colorscheme = {
           base00 = "#191A1C";
           base01 = "#393D40";
           base02 = "#202424";
           base03 = "#26282B";
           base04 = "#666666";
           base05 = "#BDBDBD";
           base06 = "#D0D0D0";
           base07 = "#F0F0F0";
           base08 = "#FF5647";
           base09 = "#F49810";
           base0A = "#D9B72B";
           base0B = "#85C46C";
           base0C = "#39CC9B";
           base0D = "#6C95EB";
           base0E = "#D688D4";
           base0F = "#4A2421";
        };
      };

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

    # extraPlugins = with pkgs; [
    #   (vimUtils.buildVimPlugin {
    #     name = "";
    #     src = fetchFromGitHub {
    #       owner = "";
    #       repo = "";
    #       rev = "";
    #       hash = "";
    #     };
    #   })
    # ];
  };
}
