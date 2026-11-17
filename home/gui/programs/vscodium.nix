{ pkgs, ... }:

{
    programs.vscodium = {
        enable = true;
        profiles.default.extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
            arcticicestudio.nord-visual-studio-code
            james-yu.latex-workshop
            ms-python.python
            llvm-vs-code-extensions.vscode-clangd
            nefrob.vscode-just-syntax
            myriad-dreamin.tinymist
        ];
        profiles.default.userSettings = {
            "breadcrumbs.enabled" = false;
            "editor.minimap.enabled" = false;
            "editor.stickyScroll.enabled" = false;
            "workbench.statusBar.visible" = false;
            "workbench.colorCustomizations" = {
                "tree.indentGuidesStroke" = "#88c0d0";
            };
            "terminal.integrated.stickyScroll.enabled" = false;

            "telemetry.telemetryLevel" = "off";
            "workbench.enableExperiments" = false;
            "chat.disableAIFeatures" = true;
            "workbench.colorTheme" = "Nord";
            "workbench.tree.indent" = 24;

            "terminal.integrated.profiles.linux" = {
                "nushell" = {
                    "path" = "/etc/profiles/per-user/hdo/bin/nu";
                };
            };
            "terminal.integrated.defaultProfile.linux" = "nushell";
            "terminal.integrated.scrollback" = 0;
            "security.workspace.trust.enabled" = false;
            "editor.fontFamily" = "'UbuntuMono Nerd Font'";
            "editor.fontSize" = 17;
            "workbench.sideBar.experimental.fontSize" = 15;
            "terminal.integrated.fontFamily" = "'UbuntuMono Nerd Font'";
            "terminal.integrated.fontSize" = 17;
            "[mips]" = {
                "editor.formatOnSave" = true;
            };
            "[cpp]" = {
                "editor.inlayHints.enabled" = "off";
            };
            "[typst]" = {
                "editor.tabSize" = 4;
                "editor.insertSpaces" = true;
                "editor.detectIndentation" = true;
            };
            "[nix]" = {
                "editor.tabSize" = 4;
            };
        };
    };
}