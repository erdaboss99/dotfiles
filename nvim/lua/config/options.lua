local opt = vim.opt

-- Global settings
vim.g.copilot_filetypes = { VimspectorPrompt = false }
vim.g.autoformat = true
vim.o.spell = false

-- Indentations
opt.tabstop = 4 -- Tab width
opt.shiftwidth = 4 -- Indent width
opt.softtabstop = 4 -- Soft tab stop
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line

-- Search settings
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- Case sensitive if uppercase in search
opt.incsearch = true -- Show matches as you type

-- Visual settings
opt.termguicolors = true -- Enable 24-bit colors
opt.textwidth = 120 -- Text width
opt.numberwidth = 2 -- Line number width
opt.signcolumn = "yes" -- Always show sign column
opt.showmatch = true -- Highlight matching brackets
opt.showmode = false -- Don't show mode in command line
opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.wrap = false -- No line wrapping
opt.cursorline = true -- Highligh current line
vim.opt.list = true
vim.opt.listchars = { trail = "·", eol = "↲", tab = "➜ " } -- Show trailing spaces and end of line

--File handling
opt.swapfile = false -- Don't create swap files
opt.updatetime = 100 -- Faster completion
opt.undofile = true -- Persistent undo
opt.timeoutlen = 400 -- Time to wait for a mapped sequence to complete
opt.autoread = true -- Auto reload files changed outside vim
opt.fileformats = "unix,dos" -- Unix line endings

-- Behavior settings
opt.backspace = "indent,eol,start" -- Better backspace behavior
opt.iskeyword:append "-" -- Treat dash as part of word
opt.shortmess:append "sI" -- Shorter messages
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.mouse = "a" -- Enable mouse support

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Split behavior
opt.splitbelow = true -- On horizontal splits, default to below
opt.splitright = true -- On vertical splits, default to right

-- Disable built-in providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Filetype detection
vim.filetype.add {
	extension = {
		env = "dotenv",
		txt = "markdown",
	},
	filename = {
		[".env"] = "dotenv",
		["env"] = "dotenv",
	},
	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
		["%.env%.[%w_.-]+"] = "dotenv",
	},
}
