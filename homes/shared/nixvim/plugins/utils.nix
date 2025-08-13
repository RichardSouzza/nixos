{ config, lib, pkgs, ... }:

with lib;

let
  isLazygitInstalled = pkgs.lazygit != null;
  isWakatimeInstalled = pkgs.wakatime-cli != null;

in
{
  programs.nixvim = {
    plugins = {
      snacks = {
        settings = {
          notifier.enabled = true;
          quickfile.enabled = true;
        };
      };

      lazygit.enable = isLazygitInstalled;
      trim.enable = true;
      wakatime.enable = true;
      which-key.enable = true;
    };

    keymaps = [
      {
        action = "<CMD>LazyGit<CR>";
        key = "gg";
        mode = "n";
        options = {
          desc = "Open Lazygit";
        };
      }
    ];
  };

  home.packages = with pkgs; [
    wakatime-cli
  ];

  home.file.".wakatime/wakatime-cli".source =
    (mkIf isWakatimeInstalled "${pkgs.wakatime}/bin/wakatime-cli");
}
