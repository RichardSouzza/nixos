{
  home.file = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
          "~/imgs/wallpapers/The Megalodon.png"
        ];

      wallpaper = [
        "eDP-1, ~/imgs/wallpapers/The Megalodon.png"
      ];
    };
  };
}
