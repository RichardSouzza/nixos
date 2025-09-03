{
  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "~/imgs/wallpapers/mountains.jpg"
      ];

      wallpaper = [
        "eDP-1, ~/imgs/wallpapers/mountains.jpg"
      ];
    };
  };
}
