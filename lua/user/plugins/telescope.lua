local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
}

function M.config()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>sg', function()
        local function git_diff(opts)
            local pickers = require "telescope.pickers"
            local finders = require "telescope.finders"
            local conf = require("telescope.config").values
            local list = vim.fn.systemlist('git diff --name-only main')

            pickers.new(opts, {
                prompt_title = "git diff",
                finder = finders.new_table { results = list },
                sorter = conf.generic_sorter(opts)
            }):find()
        end

        git_diff()
    end, { desc = "Git Diff" })

    vim.keymap.set('n', '<leader>sl', builtin.resume, { desc = "Resume last search" })
    vim.keymap.set('n', '<leader>sd', builtin.lsp_definitions, { desc = "Definitions" })
    vim.keymap.set('n', '<leader>si', builtin.lsp_implementations, { desc = "Implementatios" })
    vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = "Symbols" })
    vim.keymap.set('n', '<leader>sS', builtin.lsp_document_symbols, { desc = "Workspace symbols" })
    vim.keymap.set('n', '<leader>sn', builtin.grep_string, { desc = "Grep string" })
    vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = "Oldfiles" })
    vim.keymap.set('n', '<leader>sr', builtin.lsp_references, { desc = "Refereces" })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "Find fils" })
    vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = "Marks" })
    vim.keymap.set('n', '<leader>sc', builtin.command_history, { desc = "Command history" })
    vim.keymap.set('n', '<leader>s/', builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find current buffer" })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = "Buffers" })


    --local icons = require "user.icons"
    local actions = require "telescope.actions"


    local icons = require "user.icons"
    require("telescope").setup {
        defaults = {
            layout_config = {
                horizontal = { width = 0.95, height = 0.9 }
            },
            prompt_prefix = icons.ui.Telescope .. " ",
            selection_caret = icons.ui.Forward .. " ",
            entry_prefix = "   ",
            initial_mode = "insert",
            selection_strategy = "reset",
            path_display = { "smart" },
            color_devicons = true,
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },

            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["q"] = actions.close,
                },
            },
        },
        pickers = {
            live_grep = {
                theme = "dropdown",
            },

            grep_string = {
                theme = "dropdown",
            },

            find_files = {
                theme = "dropdown",
                previewer = false,
            },

            buffers = {
                theme = "dropdown",
                previewer = false,
                initial_mode = "normal",
                mappings = {
                    i = {
                        ["<C-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                    },
                },
            },

            planets = {
                show_pluto = true,
                show_moon = true,
            },

            colorscheme = {
                enable_preview = true,
            },

            lsp_references = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_definitions = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_declarations = {
                theme = "dropdown",
                initial_mode = "normal",
            },

            lsp_implementations = {
                theme = "dropdown",
                initial_mode = "normal",
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            },
        },
    }
end

return M
