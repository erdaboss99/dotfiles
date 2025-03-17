-- Global options
vim.g.mapleader = " " --Space as leader key
vim.g.maplocalleader = " " -- Space as local leader key
vim.g.copilot_filetypes = { VimspectorPrompt = false }
vim.opt.fileformats = "unix,dos" -- Unix line endings
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.tabstop = 4 -- 4 spaces for tabs
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- 4 spaces for autoindent
vim.opt.smartindent = true -- Smart indent
vim.opt.wrap = false -- No line wrapping
vim.opt.textwidth = 120 -- Text width
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Smart case when searching
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.number = true -- Show line numbers
vim.opt.numberwidth = 2 -- Line number width
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.splitbelow = true -- On horizontal splits, default to below
vim.opt.splitright = true -- On vertical splits, default to right
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 400 -- Time to wait for a mapped sequence to complete
vim.opt.undofile = true -- Persistent undo
vim.opt.showmode = false -- Don't show mode
vim.opt.updatetime = 100 -- Faster completion
vim.opt.swapfile = false -- No swap files
vim.opt.iskeyword:append "-" -- Treat dash separated words as a word text object
vim.opt.shortmess:append "sI" -- Shorter messages
vim.opt.list = true
vim.opt.listchars = { trail = "·", eol = "↲", tab = "➜ " } -- Show trailing spaces and end of line

-- Disable built-in providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Filetype detection
vim.filetype.add {
	extension = { mdx = "mdx", env = "sh" },
	filename = { [".env"] = "sh", ["env"] = "sh" },
}

-- Diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵 ", texthl = "DiagnosticSignHint" })
