-- fix unpack compatibility
table.unpack = table.unpack or unpack

Keys = {
	harpoon = {
		name = { ["<leader>h"] = { name = "harpoon" } },
		add_file = { "n", "<leader>hm", function() require("harpoon.mark").add_file() end, { desc = "Add file" } },
		toggle_menu = { "n", "<leader>hh", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle menu" } },
		nav_file_1 = { "n", "<leader>hr", function() require("harpoon.ui").nav_file(1) end, { desc = "Nav file 1" } },
		nav_file_2 = { "n", "<leader>hs", function() require("harpoon.ui").nav_file(2) end, { desc = "Nav file 2" } },
		nav_file_3 = { "n", "<leader>hn", function() require("harpoon.ui").nav_file(3) end, { desc = "Nav file 3" } },
		nav_file_4 = { "n", "<leader>hd", function() require("harpoon.ui").nav_file(4) end, { desc = "Nav File 4" } },
		nav_prev = { "n", "<leader>ha", function() require("harpoon.ui").nav_prev() end, { desc = "Nav prev" } },
		nav_next = { "n", "<leader>he", function() require("harpoon.ui").nav_next() end, { desc = "Nav next" } },

	},
	lsp = {
		name = { ["<leader>d"] = { name = "lsp" } },
		rename = function(bufnr)
			return { 'n', '<leader>dr', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" } }
		end,
		code_action = function(bufnr)
			return { 'n', '<leader>da', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" } }
		end,
		hover = function(bufnr)
			return { 'n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" } }
		end,
		signatur_help = function(bufnr)
			return { 'n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" } }
		end,
		go_to_definition = function(bufnr)
			return { 'n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definion" } }
		end,
		go_to_declaration = function(bufnr)
			return { 'n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" } }
		end,
		go_to_reference = function(bufnr)
			return { 'n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" } }
		end,
	},
	search = {
		name = { ["<leader>s"] = { name = "search" } },
		git_diff = { 'n', '<leader>sg', function()
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
		end, { desc = "Git Diff" } },
		definitions = { 'n', '<leader>sd', function() require('telescope.builtin').lsp_definitions() end, { desc = "Definitions" } },
		implementations = { 'n', '<leader>si', function() require('telescope.builtin').lsp_implementations() end, { desc = "Implementatios" } },

		references = { 'n', '<leader>sr', function() require('telescope.builtin').lsp_references() end, { desc = "Refereces" } },
		find_files = { 'n', '<leader>sf', function() require('telescope.builtin').find_files() end, { desc = "Find fils" } },
		marks = { 'n', '<leader>sm', function() require('telescope.builtin').marks() end, { desc = "Marks" } },
		command_history = { 'n', '<leader>sc', function() require('telescope.builtin').command_history() end, { desc = "Command history" } },
		live_grep_git_root = { 'n', '<leader>s/', function()
			local function find_git_root()
				-- Use the current buffer's path as the starting point for the git search
				local current_file = vim.api.nvim_buf_get_name(0)
				local current_dir
				local cwd = vim.fn.getcwd()
				-- If the buffer is not associated with a file, return nil
				if current_file == '' then
					current_dir = cwd
				else
					-- Extract the directory from the current file's path
					current_dir = vim.fn.fnamemodify(current_file, ':h')
				end

				-- Find the Git root directory from the current file's path
				local git_root = vim.fn.systemlist('git -C ' ..
						vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')
					[1]
				if vim.v.shell_error ~= 0 then
					print 'Not a git repository. Searching on current working directory'
					return cwd
				end
				return git_root
			end

			local function live_grep_git_root()
				local git_root = find_git_root()
				if git_root then
					require('telescope.builtin').live_grep {
						search_dirs = { git_root },
					}
				end
			end

			return live_grep_git_root()
		end, { desc = "Grep git root" } },
		help_tags = { 'n', '<leader>sh', function() require('telescope.builtin').help_tags() end, { desc = "Help tags" } },
		fuzzy_find_current_buffer = { 'n', '<leader>/', function()
			require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 0,
				previewer = false,
			})
		end, { desc = "Fuzzy find current buffer" } },
		buffers = { 'n', '<leader>sb', function()
			require('telescope.builtin').buffers(require('telescope.themes').get_dropdown {
				winblend = 0,
				previewer = false,
			})
		end, { desc = "Buffers" } },

	},
	diagnostic = {
		name = { ["<leader>x"] = { name = "trouble" } },
		toggle = { "n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle" } },
		workspace_diagnostics = { "n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Toggle workspace diagnostics" } },
		document_diagnostics = { "n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Toggle document diagnostics" } },
		quickfix = { "n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Toggle quickfix" } },
		loclist = { "n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Toggle loclist" } },
		lsp_references = { "n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "Toggle lsp references" } },
		open_float = { "n", "<leader>xk", function() vim.diagnostic.open_float() end, { desc = "Open Float" } },
	},
	undotree = { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = 'Undotree' },
	oil = { "n", "<Space>e", "<CMD>Oil<CR>", { desc = "Oil" } },
	treesitter = {
		keymaps = {
			init_selection = '<leader>i',
			node_incremental = '<leader>i',
			node_decremental = '<leader>h',
			-- scope_incremental = '<C>s',
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					['aa'] = '@parameter.outer',
					['ia'] = '@parameter.inner',
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = '@class.inner',
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					[']m'] = '@function.outer',
					[']]'] = '@class.outer',
				},
				goto_next_end = {
					[']M'] = '@function.outer',
					[']['] = '@class.outer',
				},
				goto_previous_start = {
					['[m'] = '@function.outer',
					['[['] = '@class.outer',
				},
				goto_previous_end = {
					['[M'] = '@function.outer',
					['[]'] = '@class.outer',
				},
			},
			swap = {
				enable = true,
				swap_next = {
					['<leader>a'] = '@parameter.inner',
				},
				swap_previous = {
					['<leader>A'] = '@parameter.inner',
				},
			},
		},

	},
}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.set("i", "dn", "<Esc>", { noremap = true, silent = true })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set(table.unpack(Keys.diagnostic.open_float))

vim.o.relativenumber = true
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.scrolloff = 9999
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Plugins
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{ 'tpope/vim-fugitive' },
	-- { 'tpope/vim-sleuth' },
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
	},
	{
		'echasnovski/mini.comment',
		version = nil,
		config = function()
			require('mini.comment').setup()
		end,
	},
	{
		'ThePrimeagen/harpoon',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			vim.keymap.set(table.unpack(Keys.harpoon.toggle_menu))
			vim.keymap.set(table.unpack(Keys.harpoon.add_file))
			vim.keymap.set(table.unpack(Keys.harpoon.nav_file_1))
			vim.keymap.set(table.unpack(Keys.harpoon.nav_file_2))
			vim.keymap.set(table.unpack(Keys.harpoon.nav_file_3))
			vim.keymap.set(table.unpack(Keys.harpoon.nav_file_4))
			vim.keymap.set(table.unpack(Keys.harpoon.nav_prev))
			vim.keymap.set(table.unpack(Keys.harpoon.nav_next))
		end,
	},
	-- {
	--    "LeonHeidelbach/trailblazer.nvim",
	--    config = function()
	--        require("trailblazer").setup({
	--            -- your custom config goes here
	--        })
	--    end,
	-- },
	-- {
	-- 	'echasnovski/mini.pairs',
	-- 	version = nil,
	-- 	config = function()
	-- 		require('mini.pairs').setup({
	-- 			mappings = {
	-- 			}
	--
	-- 		})
	-- 	end,
	-- },
	{
		'echasnovski/mini.surround',
		version = nil,
		config = function()
			require('mini.surround').setup()
		end,
	},
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine').setup({
				sections = {
					lualine_b = {
						{ 'diagnostics', symbols = { error = 'e', warn = 'w', info = 'i', hint = 'h' } }
					}
				}
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for keymaps that start with a native binding
				i = { "j", "k" },
				v = { "j", "k" },
			},
		},
		config = function()
			require("which-key").register(Keys.lsp.name)
			require("which-key").register(Keys.search.name)
			require("which-key").register(Keys.diagnostic.name)
			require("which-key").register(Keys.harpoon.name)
		end,
	},
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require('undotree').setup({
				window = {
					winblend = 0,
				}
			})
		end,
		keys = { -- load the plugin only when using it's keybinding:
			Keys.undotree
		},
	},
	{
		'stevearc/oil.nvim',
		config = function()
			require("oil").setup {
				columns = {
					"permissions",
					"icon",
				}
			}

			vim.keymap.set(table.unpack(Keys.oil))
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			require("onedarkpro").setup({
				colors = {
					float_bg = "require('onedarkpro.helpers').lighten('bg', 9, 'onedark_dark')",
					cursorline = "require('onedarkpro.helpers').lighten('bg', 5.3, 'onedark_dark')",
					bg_statusline = "require('onedarkpro.helpers').lighten('bg', 0, 'onedark_dark')",
				},
				highlights = {
					NormalFloat = { bg = "${float_bg}" },
				},
				options = {
					cursorline = true
				}
			})

			vim.cmd.colorscheme 'onedark_dark'
		end,
	},
	--{
	-- 'navarasu/onedark.nvim',
	--  priority = 1000,
	--  config = function()
	--     require('onedark').setup { lualine = { transparent = true } }
	--    vim.cmd.colorscheme 'onedark'
	--  end,
	-- },
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/nvim-treesitter-angular',
			'nvim-treesitter/nvim-treesitter-context',
		},
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = Keys.treesitter.keymaps,
				},
				textobjects = Keys.treesitter.textobjects,

			}
		end,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			{ 'j-hui/fidget.nvim',             opts = {} },
			'folke/neodev.nvim',
			{ "lukas-reineke/lsp-format.nvim", opts = {} },
		},
		config = function()
			require('mason').setup()
			require('mason-lspconfig').setup()
			require("lsp-format").setup {}
			require('neodev').setup()

			local on_attach = function(client, bufnr)
				require("lsp-format").on_attach(client, bufnr)
				vim.keymap.set(table.unpack(Keys.lsp.rename(bufnr)))
				vim.keymap.set(table.unpack(Keys.lsp.code_action(bufnr)))
				vim.keymap.set(table.unpack(Keys.lsp.hover(bufnr)))
				vim.keymap.set(table.unpack(Keys.lsp.signatur_help(bufnr)))
				vim.keymap.set(table.unpack(Keys.lsp.go_to_definition(bufnr)))
				vim.keymap.set(table.unpack(Keys.lsp.go_to_declaration(bufnr)))
				vim.keymap.set(table.unpack(Keys.lsp.go_to_reference(bufnr)))
			end

			local servers = {
				angularls = {},
				clangd = {},
				cssls = {},
				emmet_ls = {},
				eslint = {},
				gopls = {},
				html = {},
				jsonls = {},
				ols = {},
				rust_analyzer = {},
				tsserver = {},
				yamlls = {},
				tailwindcss = {},
				bashls = {},
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						diagnostics = { disable = { 'missing-fields' } },
					},
				},
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			local mason_lspconfig = require 'mason-lspconfig'

			mason_lspconfig.setup {
				ensure_installed = vim.tbl_keys(servers),
			}

			mason_lspconfig.setup_handlers {
				function(server_name)
					require('lspconfig')[server_name].setup {
						capabilities = capabilities,
						on_attach = on_attach,
						settings = servers[server_name],
						filetypes = (servers[server_name] or {}).filetypes,
					}
				end,
			}
		end,
	},
	{ 'mattn/emmet-vim' },
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			-- 'rafamadriz/friendly-snippets',
			'dcampos/cmp-emmet-vim',
		},
		config = function()
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			require('luasnip.loaders.from_vscode').lazy_load()
			luasnip.config.setup {}

			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = 'menu,menuone,noinsert',
				},
				mapping = cmp.mapping.preset.insert {
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete {},
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				},
				sources = {
					{ name = 'nvim_lsp' },
					-- { name = 'luasnip' },
					{ name = 'path' },
				},
			}
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
		},
		config = function()
			vim.keymap.set(table.unpack(Keys.diagnostic.toggle))
			vim.keymap.set(table.unpack(Keys.diagnostic.workspace_diagnostics))
			vim.keymap.set(table.unpack(Keys.diagnostic.document_diagnostics))
			vim.keymap.set(table.unpack(Keys.diagnostic.quickfix))
			vim.keymap.set(table.unpack(Keys.diagnostic.loclist))
			vim.keymap.set(table.unpack(Keys.diagnostic.lsp_references))
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
		config = function()
			pcall(require('telescope').load_extension, 'fzf')

			require('telescope').setup({
				defaults = {
					borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
					layout_config = {
						horizontal = { width = 0.95, height = 0.9 }
					},
				},
			})

			vim.keymap.set(table.unpack(Keys.search.git_diff))
			vim.keymap.set(table.unpack(Keys.search.definitions))
			vim.keymap.set(table.unpack(Keys.search.implementations))
			vim.keymap.set(table.unpack(Keys.search.references))
			vim.keymap.set(table.unpack(Keys.search.find_files))
			vim.keymap.set(table.unpack(Keys.search.marks))
			vim.keymap.set(table.unpack(Keys.search.command_history))
			vim.keymap.set(table.unpack(Keys.search.help_tags))
			vim.keymap.set(table.unpack(Keys.search.fuzzy_find_current_buffer))
			vim.keymap.set(table.unpack(Keys.search.buffers))
			vim.keymap.set(table.unpack(Keys.search.live_grep_git_root))
		end,
	},
})
