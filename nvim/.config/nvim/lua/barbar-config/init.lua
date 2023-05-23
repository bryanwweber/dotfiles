vim.g.barbar_auto_setup = false -- disable auto-setup

require 'barbar'.setup {
    focus_on_close = "previous",
    gitsigns = {
        added = { enabled = true, icon = '+' },
        changed = { enabled = true, icon = '~' },
        deleted = { enabled = true, icon = '-' },
    },
    filetype = {
        -- Sets the icon's highlight group.
        -- If false, will use nvim-web-devicons colors
        custom_colors = false,

        -- Requires `nvim-web-devicons` if `true`
        enabled = true,
    },
}
