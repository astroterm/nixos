{ pkgs, ... }:

{
    home = {
        username = "hdo";
        homeDirectory = "/home/hdo";
        stateVersion = "26.05";
    };

    imports = [
        ./gui-apps.nix
        ./cli.nix
        ./k8s.nix
        ./neovim.nix

        niri/niri.nix
    ];

    home.packages = with pkgs; [
        # UI packages
        nerd-fonts.ubuntu-mono
        nerd-fonts.ubuntu
        papirus-icon-theme
        bibata-cursors
        
    ];
}
