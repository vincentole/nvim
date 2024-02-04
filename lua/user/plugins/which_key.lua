local M = {
    "folke/which-key.nvim",
}

M.config = function()
    local which_key = require "which-key"

    which_key.register(
        {
            q = { "<cmd>confirm q<CR>", "Quit" },
            h = { "<cmd>nohlsearch<CR>", "NOHL" },
            [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
            v = { "<cmd>vsplit<CR>", "Split" },
            b = { name = "buffers" },
            d = { name = "debug" },
            s = { name = "search" },
            g = { name = "git" },
            f = { name = "lsp" },
            p = { name = "plugins" },
            t = { name = "test" },
            m = { name = "harpoon" },
            --p = { name = "project" },
            a = {
                name = "tab",
                n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
                N = { "<cmd>tabnew %<cr>", "New Tab" },
                o = { "<cmd>tabonly<cr>", "Only" },
                h = { "<cmd>-tabmove<cr>", "Move Left" },
                l = { "<cmd>+tabmove<cr>", "Move Right" },
            },
            T = { name = "treesitter" },
        },
        {
            mode = "n", -- NORMAL mode
            prefix = "<leader>",
        }
    )
end

return M
