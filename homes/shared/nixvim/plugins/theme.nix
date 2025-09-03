{ pkgs, ... }:

{
  programs.nixvim = {
    colorschemes = {
      nightfox = {
        enable = true;
        flavor = "carbonfox";
        settings = {
          options.transparent = true;
        };
      };
    };

    plugins = {
      gitsigns.enable = true;
    };

    extraPlugins = with pkgs; [
      (vimUtils.buildVimPlugin {
        name = "bracketpair";
        src = fetchFromGitHub {
          owner = "fedepujol";
          repo = "bracketpair.nvim";
          rev = "805b233f4fc1a36706e6fbc7259a244777677a53";
          hash = "sha256-iOAqLlj7RMMj93gxxxEIyL1ReOreBpSnXfpk1jJA1CE=";
        };
      })
    ];
  };
}
