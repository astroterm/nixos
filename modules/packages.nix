{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neovim
        wezterm
        xwayland-satellite
    ];
}
