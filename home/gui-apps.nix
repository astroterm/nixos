{ pkgs, wezterm, ... }:

{
    home.packages = with pkgs; [
        firefox
        vesktop
        vscodium
        nautilus
        file-roller
        gparted
        celluloid
        mediawriter
        handbrake
        gnome-clocks
        kdePackages.qt6ct
        r2modman
    ];

    programs.wezterm = {
        enable = true;
        package = wezterm.packages.${pkgs.system}.default;
        settings = {
            font_size = 14;
            color_scheme = "nord";

            window_decorations = "NONE";
            enable_tab_bar = false;

            window_background_opacity = 0.8;
            wayland_window_background_blur = true;

            font = pkgs.lib.mkLuaInline ''
                wezterm.font("UbuntuMono Nerd Font")
            '';
            default_prog = pkgs.lib.mkLuaInline ''
                { "nu" }
            '';

        };
    };

    programs.obs-studio = {
        enable = true;

        plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-pipewire-audio-capture
            input-overlay
            obs-vaapi
        ];
    };

    # programs.prismlauncher.enable = true;
}
