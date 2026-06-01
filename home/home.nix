{ pkgs, ... }:

{
    home = {
        username = "hdo";
        homeDirectory = "/home/hdo";
        stateVersion = "26.05";
    };

    imports = [
        niri/niri.nix
        ./gui-apps.nix
        ./cli.nix
        ./k8s.nix
    ];

    home.packages = with pkgs; [
        # UI packages
        nerd-fonts.ubuntu-mono
        nerd-fonts.ubuntu
        papirus-icon-theme
        bibata-cursors
        
    ];
}
