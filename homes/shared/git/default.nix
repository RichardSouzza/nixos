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
          algorithm = "histogram";
          tool = "nvimdiff";
        };
        difftool = {
          cmd = "nvimdiff";
          prompt = false;
        };
        merge = {
          tool = "nvimdiff2";
        };
        push = {
          autoSetupRemote = true;
        };
      };
    };
  };

  home.file.".gitconfig".source = ./gitconfig;
}
