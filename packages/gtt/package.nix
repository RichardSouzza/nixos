{ config, lib, options, pkgs, ... }:

let
  cfg = config.gtt;

in
{
  options = {
    gtt.enable = lib.mkEnableOption "Enable Google Translate TUI (gtt)";

    gtt.keymap = lib.mkOption {
      type = with lib.types; nullOr path;
      default = null;
      description = "Custom keymap file.";
    };

    gtt.theme = lib.mkOption {
      type = with lib.types; nullOr path;
      default = null;
      description = "Custom theme file.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ gtt ];

    home.file = lib.mkMerge [
      (lib.mkIf (cfg.keymap != null) {
        ".config/gtt/keymap.yaml".source = config.gtt.keymap;
      })

      (lib.mkIf (cfg.keymap != null) {
        ".config/gtt/theme.yaml".source = config.gtt.theme;
      })
    ];
  };
}
