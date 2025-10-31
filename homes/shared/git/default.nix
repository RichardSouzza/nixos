{
  programs = {
    difftastic = {
      enable = true;

      git = {
        enable = true;
        diffToolMode = true;
      };

      options = {
        background = "dark";
        display = "side-by-side-show-both";
      };
    };

    gh.enable = true;

    git = {
      enable = true;

      settings = {
        user.name = "Richard Souza";
        user.email = "souzza.richard25@gmail.com";

        core = {
          autocrlf = "input";
          editor = "nvim";
        };
        diff = {
          algorithm = "histogram";
        };
        difftool = {
          prompt = false;
        };
        merge = {
          tool = "nvimdiff2";
        };
        pager = {
          difftool = true;
        };
        push = {
          autoSetupRemote = true;
        };
      };
    };
  };
}
