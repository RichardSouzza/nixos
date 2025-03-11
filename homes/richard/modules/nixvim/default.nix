{
  imports = [
    ./keymaps
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    performance = {
      combinePlugins.enable = true;
    };
  };
}
