{ pkgs, ... }:

{
    programs.wezterm = {
        enable = true;
        settings = {
            font_size = 14;
            color_scheme = "nord";

            window_decorations = "NONE";
            enable_tab_bar = false;

            window_background_opacity = 1;
            wayland_window_background_blur = true;

            font = pkgs.lib.mkLuaInline ''
                wezterm.font("UbuntuMono Nerd Font")
            '';
            default_prog = pkgs.lib.mkLuaInline ''
                { "nu" }
            '';

        };
    };
}