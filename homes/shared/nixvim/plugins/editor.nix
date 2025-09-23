{
  programs.nixvim = {
    plugins = {
      guess-indent.enable = true;
      trim.enable = true;

      visual-multi = {
        enable = true;
        settings = {
          default_mappings = 0;
          maps = {
            "Add Cursor Up"        = "<C-Up>";
            "Add Cursor Down"      = "<C-Down>";
            "Align"                = "<A-a>";
            "Case Conversion Menu" = "<A-c>";
            "Find Prev"            = "<C-[>";
            "Find Under"           = "<C-]>";
            "Move Left"            = "<A-Left>";
            "Move Right"           = "<A-Right>";
          };
          mouse_mappings = 1;
          show_warnings = 1;
          silent_exit = 0;
        };
      };
    };

        };
        };
    ];
  };
}
