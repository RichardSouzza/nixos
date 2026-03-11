let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };

in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    alsa-lib
    alsa-oss
    go
    pkg-config
  ];

  shellHook = ''
    export PATH=$HOME/.local/bin:$PATH
  '';
}
