{ config, pkgs, inputs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      c    = "tput clear";
      cc   = "cd /etc/nixos";
      db   = "dbeaver";
      dok  = "lazydocker";
      e    = "superfile";
      g    = "lazygit";
      gg   = "gitui";
      hms  = "home-manager switch --flake /etc/nixos/#richard";
      hr   = "hyprctl reload";
      manc = "man configuration.nix";
      manh = "man home-configuration.nix";
      s    = "sudo -i";
      rm   = "gtrash put";
      rs   = "gtrash restore";
      tree = "tree --dirsfirst --gitignore";
      v    = "nvim .";
      y    = "yazi";
    };
  };
}
