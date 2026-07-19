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
}

