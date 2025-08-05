{ config, pkgs, ... }:

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

    settings = {
      manager = {
        show_hidden = true;
      };
    };

    theme = {
      flavor = {
        dark = "catppuccin-frappe";
        light = "catppuccin-frappe";
      };
    };
  };
}
