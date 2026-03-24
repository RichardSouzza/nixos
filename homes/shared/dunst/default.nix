let
  nord0     = "#2e3440";
  nord1     = "#3b4252";
  nord2     = "#434c5e";
  nord3     = "#4c566a";
  nord4     = "#d8dee9";
  nord5     = "#e5e9f0";
  nord6     = "#eceff4";

  slate-50  = "#f8fafc";
  slate-100 = "#f1f5f9";
  slate-200 = "#e2e8f0";
  slate-300 = "#cbd5e1";
  slate-400 = "#94a3b8";
  slate-500 = "#64748b";
  slate-600 = "#475569";
  slate-700 = "#334155";
  slate-800 = "#1e293b";
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
        origin = "bottom-left";
        offset = "44x36";
        corner_radius = 10;
        frame_width = 1;
        timeout = 1;

        background = nord0;
        highlight = nord4;
        foreground = nord4;
        frame_color = nord3;
      };
    };
  };
}
