require "erdaboss.core.launch"
require "erdaboss.core.options"
require "erdaboss.core.keymaps"
require "erdaboss.core.autocmds"
require "erdaboss.core.filetypes"

SPEC "erdaboss.plugins.catppuccin"
SPEC "erdaboss.plugins.devicons"
SPEC "erdaboss.plugins.lspkind"
SPEC "erdaboss.plugins.gitsigns"
SPEC "erdaboss.plugins.indent-blankline"

SPEC "erdaboss.plugins.telescope"
SPEC "erdaboss.plugins.neotree"
SPEC "erdaboss.plugins.lualine"
SPEC "erdaboss.plugins.noice"
SPEC "erdaboss.plugins.twilight"
SPEC "erdaboss.plugins.zenmode"
SPEC "erdaboss.plugins.bufferline"

SPEC "erdaboss.plugins.treesitter"
SPEC "erdaboss.plugins.lsp-config"
SPEC "erdaboss.plugins.mason-tool"
SPEC "erdaboss.plugins.mason"
SPEC "erdaboss.plugins.none-ls"
SPEC "erdaboss.plugins.cmp"
SPEC "erdaboss.plugins.copilot"
SPEC "erdaboss.plugins.comment"
SPEC "erdaboss.plugins.surround"
SPEC "erdaboss.plugins.symbol-usage"
SPEC "erdaboss.plugins.dap"
SPEC "erdaboss.plugins.dap-ui"

if vim.loop.os_uname().sysname == "Darwin" then SPEC "erdaboss.plugins.vimtex" end

SPEC "erdaboss.plugins.lazygit"
SPEC "erdaboss.plugins.obsidian"
SPEC "erdaboss.plugins.toggleterm"

SPEC "erdaboss.plugins.whichkey"

-- SPEC "erdaboss.plugins.neotest"

require "erdaboss.lazy"
