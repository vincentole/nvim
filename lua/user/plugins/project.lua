local M = {
    "ahmedkhalf/project.nvim",
}

M.config = function()
    require("project_nvim").setup {
        active = true,
        on_config_done = nil,
        manual_mode = false,
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = "global",
    }


    vim.keymap.set('n', '<leader>sp',
        function() require('telescope').extensions.projects.projects({ layout_strategy = "vertical" }) end,
        { desc = "Find projects" })
end

return M
