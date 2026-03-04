{ config, lib, pkgs, ... }:

let
  cfg = config.libqalculate;
  settingsFormat = pkgs.formats.toml { };
  inherit (lib) mkEnableOption mkPackageOption mkOption mkIf;

in
{
  options = {
    libqalculate.enable = mkEnableOption "Enable Qalculate!";

    libqalculate.package = mkPackageOption pkgs "libqalculate" { nullable = true; };

    libqalculate.settings = mkOption {
      inherit (settingsFormat) type;
      default = { };
      description = ''
        Qalculate! configuration.

        See <https://qalculate.github.io/manual/qalc.html#SETTINGS> for documentation.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = mkIf (cfg.package != null) [ cfg.package ];

    xdg.configFile = {
      "qalculate/qalc.cfg" = mkIf (cfg.settings != { }) {
        source = settingsFormat.generate "qalc.cfg" cfg.settings;
      };
    };
  };
}
