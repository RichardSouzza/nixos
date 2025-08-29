{
  description = "Richard's NixOS Flake Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, nixos-wsl, home-manager, hyprland, nixvim, nur, zen-browser, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      nurpkgs = import nur {
        inherit pkgs;
        nurpkgs = pkgs;
      };

      makeHomeConfiguration = username: hostname:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit username hostname inputs nixvim nurpkgs;
          };

          modules = [
            (import (./homes + "/${username}@${hostname}"))
          ];
        };

    in
    {
      nixosConfigurations = {
        loki = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/loki
          ];
        };

        magus = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/magus
            nixos-wsl.nixosModules.default
          ];
        };

        oracle = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/oracle ];
        };
      };

      homeConfigurations = {
        "richard@loki"  = makeHomeConfiguration "richard" "loki";
        "richard@magus" = makeHomeConfiguration "richard" "magus";
      };
    };
}
