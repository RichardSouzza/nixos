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
        ];
        parseEmoji = true;
      };
      notARepository = "skip";
      promptToReturnFromSubprocess = false;
    };
  };
}
