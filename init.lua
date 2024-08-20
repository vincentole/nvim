LAZY_PLUGIN_SPEC = {}

local function spec(item)
    table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

require "user.options"
require "user.keymaps"
require "user.autocmds"

spec "user.colorscheme"
spec "user.devicons"

-- spec "user.plugins.bqf"
spec "user.plugins.cmp"
-- spec "user.plugins.colorizer"
-- spec "user.plugins.emmet"
-- spec "user.plugins.fugative"
-- spec "user.plugins.gitsigns"
-- spec "user.plugins.harpoon"
spec "user.plugins.lsp_config"
spec "user.plugins.lualine"
-- spec "user.plugins.mini_comment"
-- spec "user.plugins.mini_cursorword"
-- spec "user.plugins.mini_surround"
-- spec "user.plugins.neogit"
-- spec "user.plugins.neoscroll"
-- spec "user.plugins.oil"
-- spec "user.plugins.project"
-- spec "user.plugins.schemastore"
spec "user.plugins.telescope"
-- spec "user.plugins.treesitter"
-- spec "user.plugins.ufo"
-- spec "user.plugins.undotree"
spec "user.plugins.which_key"

-- load lazy.nvim when the table is fully built
require "user.lazy"
