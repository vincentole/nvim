local M = {
    'ThePrimeagen/harpoon',
    dependencies = 'nvim-lua/plenary.nvim',
}

M.config = function()
    require("harpoon").setup({
        menu = {
            width = math.floor(vim.api.nvim_win_get_width(0) * 0.8),
        },
    })

    vim.keymap.set("n", "<leader>mm", function() require("harpoon.mark").add_file() end, { desc = "Add file" })
    vim.keymap.set("n", "<leader>md", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle menu" })
    vim.keymap.set("n", "<leader>ma", function() require("harpoon.ui").nav_file(1) end, { desc = "Nav file 1" })
    vim.keymap.set("n", "<leader>me", function() require("harpoon.ui").nav_file(2) end, { desc = "Nav file 2" })
    vim.keymap.set("n", "<leader>mi", function() require("harpoon.ui").nav_file(3) end, { desc = "Nav file 3" })
    vim.keymap.set("n", "<leader>mh", function() require("harpoon.ui").nav_file(4) end, { desc = "Nav File 4" })
    vim.keymap.set("n", "<leader>mp", function() require("harpoon.ui").nav_prev() end, { desc = "Nav prev" })
    vim.keymap.set("n", "<leader>mg", function() require("harpoon.ui").nav_next() end, { desc = "Nav next" })
end

return M
