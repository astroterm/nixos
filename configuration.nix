# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
    [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
      
        # Modules
        ./modules/packages.nix
        ./modules/gaming.nix
        ./modules/desktop.nix
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "neptune"; # Define your hostname.


    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Australia/Sydney";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_AU.UTF-8";


    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.hdo = {
        isNormalUser = true;
        description = "Henry Do";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Enable Flatpak
    services.flatpak.enable = true;

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit=true;
        pulse.enable=true;
    };

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    fileSystems = {
        "/mnt/storage" = {
            device = "/dev/nvme1n1p1";
            fsType = "ext4";
        };
    };

    system.stateVersion = "25.11";

}
