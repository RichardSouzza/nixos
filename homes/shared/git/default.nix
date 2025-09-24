{
  programs = {
    git = {
      enable = true;
      userName = "Richard Souza";
      userEmail = "souzza.richard25@gmail.com";

      difftastic = {
        enable = true;
        enableAsDifftool = true;
        background = "dark";
        display = "side-by-side-show-both";
      };

      extraConfig = {
        core = {
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

  home.file.".gitconfig".source = ./gitconfig;
}
