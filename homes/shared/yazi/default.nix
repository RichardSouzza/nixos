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
      require("gvfs"):setup()
    '';

    keymap = {
      mgr.prepend_keymap = [
        {
          on = "f";
          run = "plugin jump-to-char";
          desc = "Jump to char";
        }
        {
          on = "<C-d>";
          run = "plugin drag";
          desc = "Drag files";
        }
      ];
    };

    plugins = with pkgs.yaziPlugins; {
      drag = drag;
      full-border = full-border;
      git = git;
      gvfs = gvfs;
      jump-to-char = jump-to-char;
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

    shellWrapperName = "y";

    theme = {
      flavor = {
        dark = "catppuccin-frappe";
        light = "catppuccin-frappe";
      };
    };
  };
}
