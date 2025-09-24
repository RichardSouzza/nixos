{ pkgs, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      gui.sidePanelWidth = 0.2;
      git = {
        paging = {
          colorArg = "never";
          pager = "${pkgs.ydiff}/bin/ydiff -p cat -s --wrap --width={{columnWidth}}";
        };
        parseEmoji = true;
      };
      notARepository = "skip";
      promptToReturnFromSubprocess = false;
    };
  };
}
