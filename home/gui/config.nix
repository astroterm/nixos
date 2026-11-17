{ pkgs, ... }:

{
    imports = [
        programs/obs-studio.nix
        programs/vscodium.nix
        programs/wezterm.nix
    ];

    home.packages = with pkgs; [
        firefox vesktop 
        
        mediawriter
        handbrake

        nautilus
        gnome-clocks
        r2modman
        celluloid
        file-roller

        yubikey-manager
        yubioath-flutter

        jetbrains.datagrip
        jetbrains.clion

        kdePackages.qt6ct
    ];
}