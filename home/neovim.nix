{ ... }:

{
    programs.nixvim = {
        enable = true;

        colorschemes.nord.enable = true;

        opts = {
            tabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            smartindent = true;
            termguicolors = true;
            scrolloff = 8;
            clipboard = "unnamedplus";
        };

        diagnostic.settings = {
            virtual_text = true;
            underline = true;
            signs = true;
        };

        plugins = {
            yazi.enable = true;
            luasnip.enable = true;
            noice = {
                enable = true;
                settings = {
                    cmdline.view = "cmdline_popup";
                    views.cmdline_popup.position.row = 3;
                };
            };
            snacks = {
                enable = true;
                settings = {
                    bigfile.enabled = true;
                    explorer.enabled = true;
                    indent.enabled = true;
                    notifier.enabled = true;
                    quickfile.enabled = true;
                };
            };
            blink-cmp = {
                enable = true;
                settings = {
                    snippets.preset = "luasnip";
                    keymap.preset = "super-tab";
                    sources.default = [
                        "lsp" "path" "snippets" "buffer"
                    ];
                    fuzzy.implementation = "prefer_rust_with_warning";
                };
                setupLspCapabilities = true;
            };
            lsp = {
                enable = true;
                servers = {
                    nixd.enable = true;
                    ruff.enable = true;
                    yamlls.enable = true;
                    clangd.enable = true;
                    rust_analyzer = {
                        enable = true;
                        installCargo = false;
                        installRustc = false;
                    };
                };
            };
        };

        keymaps = [
            {
                mode = "n";
                key = "<C-h>";
                action = "<C-w>h";
            }
            {
                mode = "n";
                key = "<C-j>";
                action = "<C-w>j";
            }
            {
                mode = "n";
                key = "<C-k>";
                action = "<C-w>k";
            }
            {
                mode = "n";
                key = "<C-l>";
                action = "<C-w>l";
            }
        ];
        userCommands = {
            Files.command = "lua Snacks.picker.files()";
            Grep.command = "lua Snacks.picker.grep()";
            Buffers.command = "lua Snacks.picker.buffers()";
            Yazi.command = "Yazi";
            Diagnostics.command = "lua Snacks.picker.diagnostics()";
            Explorer.command = "lua Snacks.explorer()";
        };
    };

    xdg.configFile."nvim/snippets/latex.json".text = builtins.toJSON {
        "LaTeX Document" = {
            prefix = "doc";
            description = "LaTeX Document";
            body = [
                "\\documentclass[a4paper,12pt]{article}"
                ""
                "\\usepackage{tcolorbox}"
                "\\usepackage{xcolor}"
                "\\usepackage{mathtools}"
                "\\usepackage{amssymb}"
                "\\usepackage{fontspec}"
                "\\setmainfont{Ubuntu Nerd Font}"
                ""
                "\\begin{document}"
                ""
                "\\section*{\${1:Title}}"
                ""
                "$0"
                ""
                "\\end{document}"
            ];
        };
        "fraction" = {
            prefix = "frac";
            description = "fraction";
            body = "\\frac{\${1}}{\${2}}";
        };
        "inline math" = {
            prefix = "inline";
            description = "inline math";
            body = "$\${1}$";
        };
        "display math" = {
            prefix = "display";
            description = "display math";
            body = [
                "\\["
                "    $0"
                "\\]"
            ];
        };
        "itemize" = {
            prefix = "it";
            description = "itemize environment";
            body = [
                "\\begin{itemize}"
                "    \\item $1"
                "\\end{itemize}"
            ];
        };
        "parentheses" = {
            prefix = "paren";
            description = "auto parentheses";
            body = "\\left ( \${1} \\right)";
        };
        "square brackets" = {
            prefix = "sqbrac";
            description = "auto square brackets";
            body = "\\left [ \${1} \\right]";
        };
        "curly brackets" = {
            prefix = "cbrac";
            description = "auto curly brackets";
            body = "\\left { \${1} \\right}";
        };
        "absolute" = {
            prefix = "abs";
            description = "auto absolute value";
            body = "\\left | \${1} \\right|";
        };
        "notebox" = {
            prefix = "note";
            body = [
                "\\begin{tcolorbox}[colframe=orange!50!white, colback=yellow!10, left=3pt, right=3pt]"
                "    $1"
                "\\end{tcolorbox}"
            ];
        };
        "definition" = {
            prefix = "define";
            body = [
                "\\begin{tcolorbox}[colframe=violet!50!white, colback=violet!10, left=3pt, right=3pt]"
                "    $1"
                "\\end{tcolorbox}"
            ];
        };
        "idea" = {
            prefix = "idea";
            body = [
                "\\begin{tcolorbox}[colframe=cyan!100!black, colback=cyan!10, left=3pt, right=3pt]"
                "    $1"
                "\\end{tcolorbox}"
            ];
        };
        "examples" = {
            prefix = "example";
            body = [
                "\\begin{tcolorbox}[colframe=lime!70!white, colback=green!10, left=3pt, right=3pt]"
                "    $1"
                "\\end{tcolorbox}"
            ];
        };
        "warning" = {
            prefix = "warn";
            body = [
                "\\begin{tcolorbox}[colframe=red!50!white, colback=red!10, left=3pt, right=3pt]"
                "    $1"
                "\\end{tcolorbox}"
            ];
        };
    };
}