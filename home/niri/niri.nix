{ ... }:

{
    xdg.configFile."niri/config.kdl".source = ./config.kdl;
    xdg.configFile."niri/colors.json".source = ./colors.json;

    programs.dank-material-shell = {
        enable = true;
        enableCalendarEvents = true;
        systemd.enable = true;
    };
}
