{ pkgs, ... }:

{
    home.packages = with pkgs; [
        freelens-bin
        kubernetes-helm
        fluxcd
        talosctl
        kubectl
    ];
}