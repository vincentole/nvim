return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
        require("onedarkpro").setup({
            colors = {
                bg = "#282828",
                fg = "#ebdbb2",

                -- red = "#fb4934",
                -- green = "#b8bb26",
                -- yellow = "#fabd2f",
                -- purple = "#d3869b",
                -- blue = "#83a598",
                -- cyan = "#8ec07c",
                -- orange = "#fe8019",

                red = "#F29979",
                green = "#D4CC72",
                -- yellow = "#F2CD76",
                purple = "#E0B4A8",
                blue = "#BCC2A6",
                cyan = "#C1CF99",
                orange = "#F4B26C",

                yellow = "#F0D082",

                -- red = "#EEC09B",
                -- green = "#E2D599",
                -- yellow = "#EED69A",
                -- blue = "#D8D1AD",
                -- purple = "#E7CCAE",
                -- cyan = "#DAD6A8",
                -- orange = "#EECA96",


                white = "#fbf1c7",
                black = "#282828",
                gray = "#a89984",
                highlight = "#e2be7d",
                comment = "#665c54",

                float_bg = "#282828",
                cursorline = "#32302f",
                bg_statusline = "#282828",
                fg_gutter = "#282828",
                fg_gutter_inactive = "#282828",
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
