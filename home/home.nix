{ pkgs, ... }:

{
    home = {
        username = "hdo";
        homeDirectory = "/home/hdo";
        stateVersion = "26.05";
    };

    imports = [
        cli/config.nix
        gui/config.nix
        k8s/config.nix
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
