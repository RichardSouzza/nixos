{ pkgs, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      gui.sidePanelWidth = 0.2;
      git = {
        pagers = [
          {
             pager = "${pkgs.delta}/bin/delta --dark --line-numbers --paging=never --syntax-theme=ansi";
          }
          {
            externalDiffCommand = "${pkgs.difftastic}/bin/difft --color=always";
          }
        ];
        parseEmoji = true;
      };
      notARepository = "skip";
      promptToReturnFromSubprocess = false;
      quitOnTopLevelReturn = true;
      wrapLinesInStagingView = false;
    };
  };
}
