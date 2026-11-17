{ pkgs, fenix, ... }:

{
    imports = [
        programs/git.nix
        programs/neovim.nix
        programs/nushell.nix
        programs/uv.nix
        programs/yazi.nix
    ];

    home.packages = with pkgs; [
        fastfetch ripgrep wl-clipboard
        ffmpeg-full imagemagick yt-dlp

        age

        # Languages and Language tooling
        python315 clang-tools nixd just
        fenix.packages.${pkgs.system}.complete.toolchain
    ];

    programs.rclone.enable = true;
    programs.gcc.enable = true;
}