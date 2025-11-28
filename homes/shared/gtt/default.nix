{
  gtt = {
    enable = true;

    settings = {
      destination = {
        border_color = "red";
        language = {
          apertium = "English";
          bing     = "English";
          chatgpt  = "English";
          deepl    = "English";
          depplx   = "English";
          google   = "English";
          libre    = "English";
          reverso  = "English";
        };
      };
      hide_below = false;
      osc52 = true;
      source = {
        border_color = "cyan";
        language = {
          apertium = "Portuguese";
          bing     = "Portuguese (Brazil)";
          chatgpt  = "Portuguese (Portugal, Brazil)";
          deepl    = "Portuguese";
          depplx   = "Portuguese";
          google   = "Portuguese (Portugal, Brazil)";
          libre    = "Portuguese";
          reverso  = "Portuguese";
        };
      };
      theme = "tokyonight";
      translator = "Bing";
      transparent = true;
    };

    keymaps = {
      clear = "C-e";
      copy_destination = "C-c";
      copy_selected = "C-g";
      copy_source = "C-y";
      exit = "C-q";
      stop_tts = "C-i";
      swap_language = "C-s";
      toggle_below = "C-\\";
      toggle_transparent = "C-t";
      translate = "C-Space";
      tts_destination = "C-p";
      tts_source = "C-o";
    };

    themes = {
      tokyonight = {
        bg = "0x1A1B26";
        fg = "0xC0CAF5";
        gray = "0x414868";
        red = "0xF7768E";
        green = "0x9ECE6A";
        yellow = "0xE0AF68";
        blue = "0x7AA2F7";
        purple = "0xBB9AF7";
        cyan = "0x7DCFFF";
        orange = "0xFF9E64";
      };
      catppuccin = {
        bg = "0x24273A";
        fg = "0xCAD3F5";
        gray = "0x5B6078";
        red = "0xED8796";
        green = "0xA6DA95";
        yellow = "0xEED49F";
        blue = "0x8AADF4";
        purple = "0xF5BDE6";
        cyan = "0x8BD5CA";
        orange = "0xF5A97F";
      };
    };
  };
}
