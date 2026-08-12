{ ... }:

{
    services.greetd.enable = true;
    services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "niri";
    };


    programs.niri = {
        enable = true;
        useNautilus = true;
    };

    programs.dank-material-shell = {
        enable = true;
        systemd.enable = true;
        lockscreen.securityKey = {
            enable = true;
            moduleArgs = [ "cue" "userpresence=1" ];
        };
    };

    programs.dank-calendar.enable = true;
}

