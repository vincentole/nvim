local M = {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    cmd = "Gitsigns",
}

M.config = function()
    local icons = require "user.icons"

    require("gitsigns").setup {
        signs = {
            add = {
                hl = "GitSignsAdd",
                text = icons.ui.BoldLineMiddle,
                numhl = "GitSignsAddNr",
                linehl = "GitSignsAddLn",
            },
            change = {
                hl = "GitSignsChange",
                text = icons.ui.BoldLineDashedMiddle,
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
            delete = {
                hl = "GitSignsDelete",
                text = icons.ui.TriangleShortArrowRight,
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            topdelete = {
                hl = "GitSignsDelete",
                text = icons.ui.TriangleShortArrowRight,
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            changedelete = {
                hl = "GitSignsChange",
                text = icons.ui.BoldLineMiddle,
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
        },
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        update_debounce = 200,
        max_file_length = 40000,
        preview_config = {
            border = "rounded",
            style = "minimal",
            relative = "cursor",
            row = 0,
            col = 1,
        },
    }

    vim.keymap.set("n", "<leader>gj", function() require 'gitsigns'.next_hunk({ navigation_message = false }) end,
        { desc = "Next hunk" })
    vim.keymap.set("n", "<leader>gk", function() require 'gitsigns'.prev_hunk({ navigation_message = false }) end,
        { desc = "Prev hunk" })
    vim.keymap.set("n", "<leader>gp", require 'gitsigns'.preview_hunk, { desc = "Preview hunk" })
    vim.keymap.set("n", "<leader>gr", require 'gitsigns'.reset_hunk, { desc = "Reset hunk" })
    vim.keymap.set("n", "<leader>gl", require 'gitsigns'.blame_line, { desc = "Blame" })
    vim.keymap.set("n", "<leader>gR", require 'gitsigns'.reset_buffer, { desc = "Reset buffer" })
    vim.keymap.set("n", "<leader>gs", require 'gitsigns'.stage_hunk, { desc = "Stage hunk" })
    vim.keymap.set("n", "<leader>gu", require 'gitsigns'.undo_stage_hunk, { desc = "Undo stage hunk" })
    vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Git diff" })
end

return M
