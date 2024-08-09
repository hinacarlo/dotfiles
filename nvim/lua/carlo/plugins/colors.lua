return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
    },
    {
        'lifepillar/vim-gruvbox8',
        name = 'gruvbox8'

    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            local catppuccin = require("catppuccin")
            catppuccin.setup({
                transparent_background = true
            })
        end
    }
}
