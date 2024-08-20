vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Space>", "", { noremap = true, silent = true })

vim.keymap.set("n", "<m-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<m-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<m-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<m-l>", "<C-w>l", { noremap = true, silent = true })
-- vim.keymap.set("n", "<m-tab>", "<c-6>", { noremap = true, silent = true})

vim.keymap.set("n", "n", "nzz", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true, silent = true })
vim.keymap.set("n", "*", "*zz", { noremap = true, silent = true })
vim.keymap.set("n", "#", "#zz", { noremap = true, silent = true })
vim.keymap.set("n", "g*", "g*zz", { noremap = true, silent = true })
vim.keymap.set("n", "g#", "g#zz", { noremap = true, silent = true })

vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_", { noremap = true, silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', 'U', vim.cmd.redo)

vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', { noremap = true, silent = true })
