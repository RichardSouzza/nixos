{ config, lib, pkgs, ... }:

let
  cfg = config.programs.libqalculate;
  iniFormat = pkgs.formats.ini { };
  inherit (lib) mkEnableOption mkPackageOption mkOption mkIf;

in
{
  options.programs.libqalculate = {
    enable = mkEnableOption "Qalculate!, a multi-purpose cross-platform desktop calculator";

    package = mkPackageOption pkgs "libqalculate" { nullable = true; };

    settings = mkOption {
      inherit (iniFormat) type;
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
        source = iniFormat.generate "qalc.cfg" cfg.settings;
      };
    };
  };
}
