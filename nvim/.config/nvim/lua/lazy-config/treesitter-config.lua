return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter-refactor" },
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>",      desc = "Decrement selection", mode = "x" }
        },
        opts = {
            highlight = { enable = true, additional_vim_regex_highlighting = false, },
            indent = { enable = true },
            ensure_installed = {
                "bash", "c", "comment", "cpp", "css", "diff", "dockerfile",
                "git_config", "git_rebase", "gitcommit", "gitignore", "html", "ini",
                "javascript", "json", "lua", "luadoc", "luap", "markdown",
                "markdown_inline", "python", "regex", "rst", "toml", "vim", "vimdoc", "yaml"
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>"
                }
            },
            refactor = {
                highlight_definitions = {
                    enable = true,
                    clear_on_cursor_move = true
                },
                highlight_current_scope = { enable = true },
                smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
                navigation = {
                    enable = true,
                    -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
                    keymaps = {
                        goto_definition = "gnd",
                        list_definitions = "gnD",
                        list_definitions_toc = "gO",
                        goto_next_usage = "<a-*>",
                        goto_previous_usage = "<a-#>"
                    }
                }
            }
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then return false end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end
    }, -- Toggle comments in code
    { "numToStr/Comment.nvim", event = { "BufReadPost", "BufNewFile" } }
}
