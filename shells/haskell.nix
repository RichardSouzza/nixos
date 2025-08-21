let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };

in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    stack
  ];

  shellHook = ''
    export PATH=$HOME/.local/bin:$PATH
  '';
}
