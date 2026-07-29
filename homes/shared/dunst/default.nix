{ hostname, ... }:

let
  colors = (import ../colors { inherit hostname; }).colors;

in
{
  home.file = {
    ".config/hypr/notify-brightness.sh".source = ./notify-brightness.sh;
    ".config/hypr/notify-microphone-toggle.sh".source = ./notify-microphone-toggle.sh;
    ".config/hypr/notify-volume-change.sh".source = ./notify-volume-change.sh;
    ".config/hypr/notify-volume-toggle.sh".source = ./notify-volume-toggle.sh;
  };

  services.dunst = {
    enable = true;
    settings = {
      global = {
        origin = "bottom-center";
        offset = "44x36";
        icon_position = "off";
        corner_radius = 10;
        frame_width = 1;
        timeout = 1;

        background = colors.background;
        highlight = colors.highlight;
        foreground = colors.foreground;
        frame_color = colors.frame_color;
      };
    };
  };
}
