{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      trim.enable = true;
      wakatime.enable = true;
      which-key.enable = true;
    };
  };

  home.packages = with pkgs; [
    wakatime-cli
  ];

  home.file.".wakatime/wakatime-cli".source = "${pkgs.wakatime}/bin/wakatime-cli";
}
