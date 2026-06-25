{
    description = "NixOS Flake";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        fenix = {
            url = "github:nix-community/fenix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
        };
    };

    outputs = { nixpkgs, home-manager, fenix, nixvim, ... }: {
        nixosConfigurations.neptune = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            modules = [
                ./configuration.nix

                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.hdo = import ./home/home.nix;
                    home-manager.extraSpecialArgs = { inherit fenix nixvim; };
                    home-manager.sharedModules = [ nixvim.homeModules.nixvim ];
                }
            ];
        };
    };

}
