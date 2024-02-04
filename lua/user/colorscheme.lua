return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
        require("onedarkpro").setup({
            colors = {
                float_bg = "require('onedarkpro.helpers').lighten('bg', 0, 'onedark_dark')",
                cursorline = "require('onedarkpro.helpers').lighten('bg', 5.3, 'onedark_dark')",
                bg_statusline = "require('onedarkpro.helpers').lighten('bg', 0, 'onedark_dark')",
                fg_gutter = "require('onedarkpro.helpers').lighten('bg', 0, 'onedark_dark')",
            },
            highlights = {
                PmenuSel = { bg = "${selection}" },
            },
            options = {
                cursorline = true
            }
        })

        vim.cmd.colorscheme 'onedark_dark'
    end,
}


-- return {
--     "LunarVim/darkplus.nvim",
--     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--         vim.cmd.colorscheme "darkplus"
--     end,
-- }
