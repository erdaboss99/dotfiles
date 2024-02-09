local opt = vim.opt
local g = vim.g

g.copilot_filetypes = { VimspectorPrompt = false }

g.mapleader = " "

-- opt.fileformats = "dos,unix"

opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cursorline = false -- highlight the current line
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.tabstop = 4 -- insert 4 spaces for a tab
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.smarttab = true
opt.smartindent = true
opt.wrap = false -- display lines as one long line
opt.textwidth = 120
-- opt.colorcolumn = "120"
opt.showtabline = 1 -- always show tabs
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case
opt.mouse = "a" -- allow the mouse to be used in neovim

-- Numbers
opt.number = true -- set numbered lines
opt.numberwidth = 2 -- set number column width to 2
opt.ruler = false
opt.relativenumber = true -- set relative numbered lines

opt.signcolumn = "yes"
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.termguicolors = true -- set term gui colors
opt.timeoutlen = 400
opt.undofile = true -- enable persistent undo
opt.showmode = false
opt.updatetime = 100 -- faster completion
opt.swapfile = false -- turn off swapfiles

opt.iskeyword:append "-" -- treat dash separated words as a word text object

opt.shortmess:append "sI" -- disable nvim intro

-- disable some default providers
for _, provider in ipairs {
	"node",
	"perl",
	"python3",
	"ruby",
} do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
