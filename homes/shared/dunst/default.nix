{ colors, ... }:

let
  colors = (import ../colors).colors;

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
        corner_radius = 10;
        frame_width = 1;
        timeout = 1;

        background = colors.nord.base0;
        highlight = colors.tailwindcss.slate-300;
        foreground = colors.nord.base4;
        frame_color = colors.nord.base3;
      };
    };
  };
}
