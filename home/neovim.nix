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

        plugins = {
            yazi.enable = true;
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
            Explore.command = "lua Snacks.explorer()";
        };
    };
}