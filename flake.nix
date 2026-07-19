{
    description = "NixOS Flake";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        dms = {
            url = "github:AvengeMedia/DankMaterialShell";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        fenix = {
            url = "github:nix-community/fenix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
        };
        wezterm = {
            url = "github:wezterm/wezterm?dir=nix";
        };
    };

    outputs = { nixpkgs, home-manager, fenix, nixvim, dms, wezterm, ... }: {
        nixosConfigurations.neptune = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            modules = [
                ./configuration.nix

                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.hdo = import ./home/home.nix;
                    home-manager.extraSpecialArgs = {
                        inherit fenix nixvim wezterm;
                    };
                    home-manager.sharedModules = [
                        nixvim.homeModules.nixvim
                        dms.homeModules.dank-material-shell
                    ];
                }
            ];
        };
    };

}
