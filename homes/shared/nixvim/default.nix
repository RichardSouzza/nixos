{ pkgs, ... }:

{
  imports = [
    ./keymaps
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    # package = pkgs.neovim-unwrapped.overrideAttrs (old: {
    #   version = "v0.10.4";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "neovim";
    #     repo = "neovim";
    #     rev = "e96f75a4e60c9082e89c7f61e2ce0647e4ebdf43";
    #     hash = "sha256-TAuoa5GD50XB4OCHkSwP1oXfedzVrCBRutNxBp/zGLY=";
    #   };
    #   buildInputs = with pkgs; old.buildInputs ++ [
    #     libvterm-neovim
    #     msgpack-c
    #   ];
    # });

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    nixpkgs.useGlobalPackages = true;

    clipboard.providers.wl-copy.enable = true;

    performance = {
      combinePlugins.enable = true;
    };

    opts = {
      expandtab = true;
      number = true;
      scrolloff = 1000;
      showmode = false;
      shiftwidth = 2;
      tabstop = 4;
      wrap = false;
    };
  };
}
