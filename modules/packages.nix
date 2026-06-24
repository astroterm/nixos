{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neovim
        wezterm
        xwayland-satellite
        openrgb-with-all-plugins
        i2c-tools
    ];
    nix.package = pkgs.lixPackageSets.stable.lix;
}
