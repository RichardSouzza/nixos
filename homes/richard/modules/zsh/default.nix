{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      c    = "clear";
      cc   = "cd /etc/nixos";
      dok  = "lazydocker";
      hms  = "home-manager switch --flake /etc/nixos/#richard";
      manc = "man configuration.nix";
      manh = "man home-configuration.nix";
      tree = "tree --dirsfirst --gitignore";
      v    = "nvim .";
      y    = "yazi";
    };
  };
}
