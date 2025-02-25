{
  description = "Richard's NixOS Flake Configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      nixvimLib = nixvim.lib.${system};
      nixvim = nixvim.legacyPackages.${system};
      nixvimModule = {
        inherit system;
        module = import ./modules/nixvim;
      };
      nvim = nixvim.makeNixvimWithModule nixvimModule;

    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            inputs.home-manager.nixosModules.default
          ];
        };

        loki = nixpkgs.lib.nixosSystem {
          modules = [ ./hosts/loki ];
          specialArgs = { inherit inputs; };
        };

        oracle = nixpkgs.lib.nixosSystem {
          modules = [ ./hosts/oracle ];
          specialArgs = { inherit inputs; };
        };
      };

      environment.systemPackages = [
        (nixvim.legacyPackages."${pkgs.stdenv.hostPlatform.system}".makeNixvim {
          enable = true;
        })
      ];

      homeConfigurations."richard" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit nixvim;
        };
        modules = [
          ./homes/richard/home.nix
        ];
      };
    };
}
