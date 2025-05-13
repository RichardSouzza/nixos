{
  imports = [
    ./keymaps.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    nixpkgs.useGlobalPackages = true;

    clipboard.providers.wl-copy.enable = true;

    performance = {
      combinePlugins.enable = true;
    };

    extraConfigLua = "
      vim.opt.expandtab = true
      vim.opt.relativenumber = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 4
    ";
  };
}
