{ pkgs, ... }:

{
    home.packages = with pkgs; [
        fastfetch
        python315
        nixd
        parted
        ffmpeg
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

    programs.cargo.enable = true;
}