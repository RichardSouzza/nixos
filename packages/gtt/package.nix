{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.gtt;
  settingsFormat = pkgs.formats.yaml { };

in
{
  options = {
    gtt.enable = mkEnableOption "Enable Google Translate TUI (GTT)";

    gtt.package = mkPackageOption pkgs "gtt" { nullable = true; };

    gtt.settings = mkOption {
      inherit (settingsFormat) type;
      default = { };
      description = ''
        GTT configuration.

        See <https://github.com/eeeXun/gtt/blob/master/config.go#L39-L63> for documentation.
      '';
    };

    gtt.keymaps = mkOption {
      inherit (settingsFormat) type;
      default = { };
      description = ''
        GTT keymap file.

        See <https://github.com/eeeXun/gtt?tab=readme-ov-file#key-map> for documentation.
      '';
    };

    gtt.themes = mkOption {
      inherit (settingsFormat) type;
      default = { };
      description = ''
        GTT theme file.

        See <https://github.com/eeeXun/gtt?tab=readme-ov-file#customize-theme> for documentation.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = mkIf (cfg.package != null) [ cfg.package ];

    xdg.configFile = {
      "gtt/gtt.yaml" = mkIf (cfg.settings != { }) {
        source = settingsFormat.generate "gtt-settings" cfg.settings;
      };

      "gtt/keymap.yaml" = mkIf (cfg.keymaps != { }) {
        source = settingsFormat.generate "gtt-keymaps" cfg.keymaps;
      };

      "gtt/theme.yaml" = mkIf (cfg.themes != { }) {
        source = settingsFormat.generate "gtt-themes" cfg.themes;
      };
    };
  };
}
