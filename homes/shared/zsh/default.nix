{ pkgs, hostname, username, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion.enable = true;
    history.ignoreAllDups = true;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = "zsh-shift-select";
        file = "zsh-shift-select.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "jirutka";
          repo = "zsh-shift-select";
          rev = "v0.1.1";
          sha256 = "sha256-4kUUBH2GTMb/d6PUNiSNFogkvDUSwMX823j4xsroJKs=";
        };
      }
      {
        name = "zsh-vi-mode";
        file = "zsh-vi-mode.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "jeffreytse";
          repo = "zsh-vi-mode";
          rev = "v0.12.0";
          sha256 = "sha256-EYr/jInRGZSDZj+QVAc9uLJdkKymx1tjuFBWgpsaCFw=";
        };
      }
    ];

    shellAliases = {
      act   = "sudo /etc/nixos/hosts/activation.sh";
      c     = "tput clear";
      cc    = "cd /etc/nixos";
      cdc   = "cd ~/Nixvim";
      db    = "dbeaver";
      dok   = "lazydocker";
      dtree = "lsd --tree";
      e     = "superfile";
      g     = "lazygit";
      gg    = "gitui";
      hms   = "home-manager switch --flake /etc/nixos/#${username}@${hostname} --impure";
      hr    = "hyprctl reload";
      ls    = "lsd --group-directories-first --literal";
      manc  = "man configuration.nix";
      manh  = "man home-configuration.nix";
      mann  = "man nixvim";
      nsh   = "nix-shell --command 'zsh'";
      s     = "sudo -i";
      rm    = "gtrash put";
      rs    = "gtrash restore";
      tgpt  = "tgpt --provider sky";
      tree  = "tree --gitignore --dirsfirst";
      v     = "nvim .";
      vf    = "vf";
      y     = "y";
    };

    initContent = # zsh
    ''
      # Open file in nvim with the current folder set to the git root
      vf() {
        file=$(fzf) || return
        root=$(git -C "$(dirname "$file")" rev-parse --show-toplevel 2>/dev/null)
        nvim "$file" +"cd ''${root:-$(dirname "$file")}"
      }

      # Move to the current folder when exiting Yazi.
      # https://github.com/sxyazi/yazi/discussions/1034#discussioncomment-12891811
      function y() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
              cd -- "$cwd"
                      zle reset-prompt
          fi
          rm -f -- "$tmp"
      }

      # Configure keybinds
      bindkey -e

      bindkey "^[OH"    beginning-of-line   # home
      bindkey "^[OF"    end-of-line         # end
      bindkey "^[[3~"   delete-char         # delete
      bindkey "^[[1;5D" backward-word       # C-left
      bindkey "^[[1;5C" forward-word        # C-right
      bindkey "^[[3;5~" delete-word         # C-delete
      bindkey "^P"      yank                # C-p
      bindkey "^X"      backward-kill-word  # C-x
      bindkey "^Y"      copy-region-as-kill # C-y

      # Configure dotnet path
      # export PATH="$HOME/.dotnet/tools:$PATH"
      # export DOTNET_ROOT=$HOME/.dotnet
      export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [
        pkgs.stdenv.cc.cc.lib
        pkgs.zlib.out
      ]}"

      # Disable Starship warnings
      STARSHIP_LOG="error"

      # Ensures the existence of tmpfs
      if [ ! -d "/run/user/$UID" ]; then
        export XDG_RUNTIME_DIR="/tmp/runtime-$UID"
        mkdir -p "$XDG_RUNTIME_DIR"
        chmod 700 "$XDG_RUNTIME_DIR"
      fi
    '';
  };
}
