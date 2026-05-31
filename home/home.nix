{ pkgs, ... }:

{
    home.stateVersion = "26.05";

    home.username = "hdo";
    home.homeDirectory = "/home/hdo";

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
