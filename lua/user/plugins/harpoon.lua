local M = {
    'ThePrimeagen/harpoon',
    dependencies = 'nvim-lua/plenary.nvim',
}

M.config = function()
    vim.keymap.set("n", "<leader>mm", function() require("harpoon.mark").add_file() end, { desc = "Add file" })
    vim.keymap.set("n", "<leader>mh", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle menu" })
    vim.keymap.set("n", "<leader>md", function() require("harpoon.ui").nav_file(1) end, { desc = "Nav file 1" })
    vim.keymap.set("n", "<leader>mn", function() require("harpoon.ui").nav_file(2) end, { desc = "Nav file 2" })
    vim.keymap.set("n", "<leader>ms", function() require("harpoon.ui").nav_file(3) end, { desc = "Nav file 3" })
    vim.keymap.set("n", "<leader>mr", function() require("harpoon.ui").nav_file(4) end, { desc = "Nav File 4" })
    vim.keymap.set("n", "<leader>ma", function() require("harpoon.ui").nav_prev() end, { desc = "Nav prev" })
    vim.keymap.set("n", "<leader>me", function() require("harpoon.ui").nav_next() end, { desc = "Nav next" })
end

return M
