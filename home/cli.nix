{ pkgs, fenix, ... }:

{
    home.packages = with pkgs; [
        fastfetch
        python315
        nixd
        parted
        ffmpeg-full
        imagemagick
        yt-dlp
        jdk21
        beammp-launcher
        wl-clipboard
        fenix.packages.${pkgs.system}.complete.toolchain
    ];

    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "astroterm";
                email = "henry@astrocore.dev";
            };
            init.defaultBranch = "main";
            pull.rebase = true;
        };
    };

    programs.nushell = {
        enable = true;
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake /home/hdo/nix-config/#neptune";
        };
    };

    programs.uv = {
        enable = true;
        settings = {
            python-downloads = "never";
            python-preference = "only-system";
        };
    };

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
            ffmpeg
            p7zip
            jq
            poppler
            fd
            ripgrep
            fzf
            zoxide
            resvg
            imagemagick
        ];
    };

    programs.gcc.enable = true;
    programs.rclone.enable = true;
}