{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    flavors = {
      "catppuccin-frappe" = pkgs.fetchFromGitHub {
        owner = "yazi-rs";
        repo = "flavors";
        rev = "0f9204bc948c8313963f5c9d571a82edc201f8aa";
        hash = "sha256-qWNArjWuxWL+rOjLzyIniW5hJgWiAWTCgXmMXJpaWZE=";
      } + "/catppuccin-frappe.yazi";
    };

    initLua = ''
      require("full-border"):setup()
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
      drag = drag;                 # https://github.com/Joao-Queiroga/drag.yazi
      full-border = full-border;   # https://github.com/yazi-rs/plugins/tree/main/full-border.yazi
      jump-to-char = jump-to-char; # https://github.com/yazi-rs/plugins/tree/main/jump-to-char.yazi
      mount = mount;               # https://github.com/yazi-rs/plugins/tree/main/mount.yazi
    };

    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "natural";
        prepend_keymap = {
          on = "M";
          run = "plugin mount";
        };
      };
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
