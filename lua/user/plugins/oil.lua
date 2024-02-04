local M = {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
}

M.config = function()
    require("oil").setup({
        columns = {
            "permissions",
            "icon",
        }
    })

    vim.keymap.set("n", "<Space>e", "<CMD>Oil<CR>", { desc = "Oil" })
end

return M
