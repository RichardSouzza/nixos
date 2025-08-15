{
  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        # "~/imgs/wallpapers/.png"
      ];

      wallpaper = [
        # "eDP-1, ~/imgs/wallpapers/.png"
      ];
    };
  };
}
