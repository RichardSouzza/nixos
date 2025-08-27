{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    flavors = {
      "catppuccin-frappe" = pkgs.fetchFromGitHub {
        owner = "yazi-rs";
        repo = "flavors";
        rev = "main";
        hash = "sha256-xMaZoWSetXHg772cwqBTEcdXdnGYQVaiUDcjKk9r53w=";
      } + "/catppuccin-frappe.yazi";
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup()
    '';

    keymap = {
      mgr.prepend_keymap = [
        {
          on = "f";
          run = "plugin jump-to-char";
          desc = "Jump to char";
        }
      ];
    };

    plugins = with pkgs; {
      full-border = yaziPlugins.full-border;
      git = yaziPlugins.git;
      jump-to-char = yaziPlugins.jump-to-char;
    };

    settings = {
      mgr = {
        show_hidden = true;
      };
      plugin.prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }
        {
          id = "git";
          name = "*/";
          run = "git";
        }
      ];
    };

    theme = {
      flavor = {
        dark = "catppuccin-frappe";
        light = "catppuccin-frappe";
      };
    };
  };
}
