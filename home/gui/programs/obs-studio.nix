{ pkgs, ... }:

{
    programs.obs-studio = {
        enable = true;

        plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-pipewire-audio-capture
            input-overlay
            obs-vaapi
        ];
    };

}