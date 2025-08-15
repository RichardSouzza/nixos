{
  programs.waybar = {
    enable = true;
    style = ./style.css;

    settings = {
      mainBar = {
        reload_style_on_change = true;
        margin = "8px 20px -8px";
        spacing = 12;

        modules-left = [
          "cpu"
          "temperature"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "pulseaudio"
          "custom/separator"
          "network"
          "battery"
          "clock"
        ];

        battery = {
          format = "| {icon}  {capacity}% |";
          format-icons = ["" "" "" "" ""];
          states = {
            warning = 30;
            critical = 15;
          };
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%d/%m/%Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months   = "<span color='#ffead3'><b>{}</b></span>";
              days     = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks    = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today    = "<span color='#89b4fa'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        cpu = {
          interval = 1;
          format = "  {usage}%";
        };

        "custom/separator" = {
          format = "|";
          interval = "once";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          sort-by-number = true;
        };

        network = {
          format = "{ifname}";
          format-wifi = "  {essid}";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-bluetooth = "{icon}  {volume}% ";
          format-muted = "";
          format-icons = {
            default = ["" "" "" "" "" "" "" "" "" ""]; # 0% - 10% - 50% - 100%
            car = "";
            hands-free = "";
            headphone = "";
            headset = "";
            phone = "";
            phone-muted = "";
            portable = "";
          };
        };

        temperature = {
          format = "| {temperatureC}°C ";
          critical-threshold = 80;
          tooltip = false;
        };
      };
    };
  };
}
