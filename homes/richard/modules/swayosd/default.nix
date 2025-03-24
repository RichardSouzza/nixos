{
  services.swayosd = {
    enable = true;
    topMargin = 0.8;
  };

  home.file = {
    ".config/swayosd/style.css".source = ./style.css;
  };
}

