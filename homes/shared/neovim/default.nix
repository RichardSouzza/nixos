{ lib, pkgs, ... }:

with lib;

let
  isWakatimeInstalled = pkgs.wakatime-cli != null;

in
{
  home.file = {
    ".sqlfluff".source = ./sqlfluff.toml;
    ".wakatime/wakatime-cli".source =
      (mkIf isWakatimeInstalled "${pkgs.wakatime-cli}/bin/wakatime-cli");
  };
}
