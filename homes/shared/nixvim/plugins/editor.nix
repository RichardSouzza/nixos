{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      trim.enable = true;

      visual-multi = {
        enable = true;
        settings = {
          default_mappings = 0;
          maps = {
            "Add Cursor Up"        = "<C-Up>";
            "Add Cursor Down"      = "<C-Down>";
            "Align"                = "<A-a>";
            "Case Conversion Menu" = "<A-c>";
            "Find Prev"            = "<C-[>";
            "Find Under"           = "<C-]>";
            "Move Left"            = "<A-Left>";
            "Move Right"           = "<A-Right>";
          };
          mouse_mappings = 1;
          show_warnings = 1;
          silent_exit = 0;
        };
      };
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
