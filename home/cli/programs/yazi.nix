{ pkgs, ... }:

{
    programs.yazi = {
        enable = true;
        enableNushellIntegration = true;
        plugins = with pkgs.yaziPlugins; {
            smart-enter = smart-enter;
            smart-filter = smart-filter;
            mime-ext = mime-ext;
            ouch = ouch;
            nord = nord;
        };
        extraPackages = with pkgs; [
            ffmpeg p7zip jq poppler
            ripgrep fzf zoxide resvg
            imagemagick fd
        ];
    };
}