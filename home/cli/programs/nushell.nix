{ ... }:

{
    programs.nushell = {
        enable = true;
        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake /home/hdo/nix-config/#neptune";
        };
        loadSessionVariables = true;
    };
}