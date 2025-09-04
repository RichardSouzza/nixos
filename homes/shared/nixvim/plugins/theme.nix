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
  };
}
