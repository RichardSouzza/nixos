{ config, lib, pkgs, ... }:

let
  cfg = config.programs.scooter;
  tomlFormat = pkgs.formats.toml { };
  inherit (lib) mkEnableOption mkPackageOption mkOption mkIf;

in
{
  options.programs.scooter = {
    enable = mkEnableOption "Scooter, an interactive find-and-replace terminal UI app";

    package = mkPackageOption pkgs "scooter" { nullable = true; };

    settings = mkOption {
      inherit (tomlFormat) type;
      default = { };
      description = ''
        Scooter configuration.

        See <https://github.com/thomasschafer/scooter?tab=readme-ov-file#configuration-options> for documentation.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = mkIf (cfg.package != null) [ cfg.package ];

    xdg.configFile = {
      "scooter/config.toml" = mkIf (cfg.settings != { }) {
        source = tomlFormat.generate "config.toml" cfg.settings;
      };
    };
  };
}
