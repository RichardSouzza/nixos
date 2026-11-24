{
  programs.kitty = {
    enable = true;

    settings = {
      background_opacity = 0.6;
      confirm_os_window_close = 0;
      font_name = "JetBrainsMono Nerd Font";
      font_size = 8;
      mouse_map = "right click ungrabbed paste_from_clipboard";
      progress_bar = "hidden";
    };

    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+backspace" = "send_text all \\x17";
      "ctrl+shift+up" = "no_op";
      "ctrl+shift+down" = "no_op";
      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";
    };
  };
}
