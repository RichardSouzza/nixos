{
  programs = {
    git = {
      enable = true;
      userName = "Richard Souza";
      userEmail = "souzza.richard25@gmail.com";

      extraConfig = {
        core = {
          editor = "nvim";
        };
        diff = {
          tool = "gitui";
        };
        difftool = {
          prompt = false;
        };
        pull = {
          rebase = false;
        };
      };
    };

    gitui.enable = true;
  };

  home.file.".gitconfig".source = ./gitconfig;
}
