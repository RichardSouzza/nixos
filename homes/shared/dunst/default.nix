let
  blue-700  = "#1d4ed8";
  blue-900  = "#1e3a8a";
  slate-300 = "#cbd5e1";
  slate-900 = "#0f172a";

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
        offset = "0x36";
        frame_width = 1;
        frame_color = blue-900;
        background = slate-900;
        foreground = slate-300;
        highlight = blue-700;
        timeout = 1;
      };
    };
  };
}
