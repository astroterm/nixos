{ ... }:

{
    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "astroterm";
                email = "git@hdo.sh";
            };
            init.defaultBranch = "main";
            pull.rebase = true;
        };
    };
}