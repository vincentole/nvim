local M = {
    "folke/which-key.nvim",
}

M.config = function()
    local which_key = require("which-key")

    which_key.add(
        {
            mode = { "n" }, -- NORMAL mode

            { "<leader>q",  "<cmd>confirm q<CR>",  desc = "Quit" },
            { "<leader>h",  "<cmd>nohlsearch<CR>", desc = "nohl" },
            { "<leader>v",  "<cmd>vsplit<CR>",     desc = "Split" },
            { "<leader>y",  "yi",                  desc = "Yank inner" },
            { "<leader>b",  group = "buffers" },
            { "<leader>d",  group = "diagnostic" },
            { "<leader>s",  group = "search" },
            { "<leader>g",  group = "git" },
            { "<leader>l",  group = "lsp" },
            { "<leader>p",  group = "plugins" },
            { "<leader>m",  group = "harpoon" },
            --p = { "<leader>q", group = "project" },

            { "<leader>a",  group = "tab" },
            { "<leader>an", "<cmd>$tabnew<cr>",    desc = "New empty tab" },
            { "<leader>aN", "<cmd>tabnew %<cr>",   desc = "New tab" },
            { "<leader>ao", "<cmd>tabonly<cr>",    desc = "Only" },
            { "<leader>ah", "<cmd>-tabmove<cr>",   desc = "Move left" },
            { "<leader>al", "<cmd>+tabmove<cr>",   desc = "Move right" },

            { "<leader>t",  group = "treesitter" },
        }
    )
end

return M
