return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local rainbow_delimiters = require("rainbow-delimiters")
            -- local colors =  
            vim.g.rainbow_delimiters = {
                strategy={
                    [''] = rainbow_delimiters.strategy['global'],
                },
                query={
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
            }
        end,
    },
}
