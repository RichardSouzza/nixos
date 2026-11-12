{
  programs = {
    zsh.enable = true;
  };

  environment.extraInit = ''
    unset -v SSH_ASKPASS
  '';
}
