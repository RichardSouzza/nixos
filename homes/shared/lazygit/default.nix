{ pkgs, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      gui.sidePanelWidth = 0.2;
      git = {
        pagers = [
          {
            externalDiffCommand = "${pkgs.difftastic}/bin/difft --color=always";
          }
          {
             pager = "${pkgs.delta}/bin/delta --dark --line-numbers --paging=never --syntax-theme=ansi";
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
