{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      c = "clear";
      hms = "home-manager switch --flake /etc/nixos/#richard";
      manc = "man configuration.nix";
      manh = "man home-configuration.nix";
      tree = "tree --dirsfirst --gitignore";
      y = "yazi";
    };
  };
}
