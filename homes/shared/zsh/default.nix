{ hostname, username, ... }:

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
      hms  = "source /etc/nixos/hosts/activation.sh && home-manager switch --flake /etc/nixos/#${username}@${hostname}";
      hr   = "hyprctl reload";
      ls   = "lsd --group-directories-first";
      manc = "man configuration.nix";
      manh = "man home-configuration.nix";
      nsh  = "nix-shell --command 'zsh'";
      s    = "sudo -i";
      rm   = "gtrash put";
      rs   = "gtrash restore";
      tree = "lsd --tree";
      v    = "nvim .";
      y    = "yy";
    };

    initContent = ''
      function y() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
              cd -- "$cwd"
                      zle reset-prompt
          fi
          rm -f -- "$tmp"
      }
    '';
  };
}
