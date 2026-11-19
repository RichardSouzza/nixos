{ pkgs, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      gui.sidePanelWidth = 0.2;
      git = {
        diffRenderers = [
          {
             command = "${pkgs.delta}/bin/delta --dark --line-numbers --paging=never --syntax-theme=ansi";
          }
          {
             command = "${pkgs.difftastic}/bin/difft --color=always";
             type = "extDiff";
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
