{ pkgs, ... }:

{
    programs.wireshark = {
        enable = true;
        dumpcap.enable = true;
    };

    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            stdenv.cc.cc.lib
        ];
    };

    programs._1password.enable = true;
    programs._1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "hdo" ];
    };
}

