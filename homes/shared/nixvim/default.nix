{
  imports = [
    ./keymaps
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
