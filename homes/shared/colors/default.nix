rec {
  palletes = {
    nord = {
      base0  = "#2e3440";
      base1  = "#3b4252";
      base2  = "#434c5e";
      base3  = "#4c566a";
      base4  = "#d8dee9";
      base5  = "#e5e9f0";
      base6  = "#eceff4";
      base7  = "#8fbcbb";
      base8  = "#88c0d0";
      base9  = "#81a1c1";
      base10 = "#5e81ac";
      base11 = "#bf616a";
      base12 = "#d08770";
      base13 = "#ebcb8b";
      base14 = "#a3be8c";
      base15 = "#b48ead";
    };

    tailwindcss = {
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
    };
  };

  colorsMapping = with palletes;  {
    loki = {
      # Dunst
      background = nord.base0;
      highlight = tailwindcss.slate-300;
      foreground = nord.base4;
      frame_color = nord.base3;

      # Zen Browser
      accentColor = nord.base2;
      textHighlightBackground = nord.base2;
      textSelectAttentionBackground = nord.base14;
    };

    oracle = {
      # TODO: Set colors
    };
  };

  getColorsByHostname = hostname:
    builtins.getAttr hostname colorsMapping;
}
