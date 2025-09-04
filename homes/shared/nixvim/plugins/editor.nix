{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      trim.enable = true;
    };

    extraPlugins = with pkgs; [
      (vimUtils.buildVimPlugin {
        name = "guess-indent";
        src = fetchFromGitHub {
          owner = "nmac427";
          repo = "guess-indent.nvim";
          rev = "84a4987ff36798c2fc1169cbaff67960aed9776f";
          hash = "sha256-M/FkwCXXhojVFEcCuHo/GkuCCSX9GlVYHBUECSZxBjs=";
        };
        meta = {
          homepage = "https://github.com/NMAC427/guess-indent.nvim";
          license = lib.licenses.mit;
        };
      })
    ];
  };
}
