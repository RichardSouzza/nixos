{ lib, ... }:

with lib;

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = ./starship.toml |> builtins.readFile |> builtins.fromTOML;
  };
}
