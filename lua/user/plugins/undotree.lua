local M = {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
}

M.config = function()
    require('undotree').setup({
        float_diff = true,
        window = {
            winblend = 0,
        }
    })

    vim.keymap.set('n', '<leader>u', require('undotree').toggle, { desc = "Undotree" })
end

return M
