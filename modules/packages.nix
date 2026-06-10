{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neovim
        wezterm
        xwayland-satellite
    ];
    nix.package = pkgs.lixPackageSets.stable.lix;
}
