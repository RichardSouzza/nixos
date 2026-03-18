{
  programs = {
    delta = {
      enable = true;
    };

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

      # includes = [
      #   {
      #     condition = "hasconfig:remote.*.url:git@github.com:*/**";
      #     contents = {
      #       user.name = "Richard Souza";
      #       user.email = "souzza.richard25@gmail.com";
      #     };
      #   }
      #   {
      #     condition = "hasconfig:remote.*.url:git@gitlab.com:*/**";
      #     contents = {
      #       user.name = "Richard de Souza Santos";
      #       user.email = "richards@seed.se.gov";
      #       http.sslVerify = false;
      #     };
      #   }
      #   {
      #     condition = "hasconfig:remote.*.url:git@app-prod-gitlab.seduc.se.gov.br:*/**";
      #     contents = {
      #       user.name = "Richard de Souza Santos";
      #       user.email = "richards@seed.se.gov";
      #       http.sslVerify = false;
      #     };
      #   }
      # ];
    };
  };
}
