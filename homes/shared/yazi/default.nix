{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    flavors = {
      "catppuccin-frappe" = pkgs.fetchFromGitHub {
        owner = "yazi-rs";
        repo = "flavors";
        rev = "ffe6e3a16c5c51d7e2dedacf8de662fe2413f73a";
        hash = "sha256-hEnrvfJwCAgM12QwPmjHEwF5xNrwqZH1fTIb/QG0NFI=";
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
        sort_by = "natural";
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
