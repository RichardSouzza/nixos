{
  programs.kitty = {
    enable = true;
    
    settings = {
      confirm_os_window_close = 0;
      background_opacity = 0.5;
      font_size = 8;
      font_name = "JetBrainsMono Nerd Font";
      mouse_map = "right click ungrabbed paste_from_clipboard";
    };

    keybindings = {
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
    };
  };
}
