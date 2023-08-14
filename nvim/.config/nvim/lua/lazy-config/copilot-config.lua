return {
    {
        "zbirenbaum/copilot.lua",
        cmd = { "Copilot" },
        event = { "BufReadPre", "BufNewFile" },
        enable = false,
        opts = {
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept_word = "<TAB>",
                    accept_line = "<M-;>",
                },
            },
            panel = {
                auto_refresh = true,
                layout = {
                    position = "right",
                },
            },
            filetypes = {
                yaml = true,
                ["*"] = true,
            },
        },
    }
}
