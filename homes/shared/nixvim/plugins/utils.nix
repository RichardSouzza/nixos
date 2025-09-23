{ lib, pkgs, ... }:

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
          picker.enabled = true;
          quickfile.enabled = true;
        };
      };

      lazygit.enable = isLazygitInstalled;
      wakatime.enable = true;
      which-key.enable = true;
    };

    keymaps = [
      {
        action = "<CMD>lua Snacks.picker.files({ hidden = true })<CR>";
        key = "gf";
        mode = "n";
        options = {
          desc = "Close buffer";
          silent = true;
        };
      }
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
