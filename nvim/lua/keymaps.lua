local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

-- Quickfix
map("n", "<leader>q", "<CMD>copen<CR>", opts "Open quickfix list")
map("n", "[q", "<CMD>cprev<CR>", opts "Prev quickfix item")
map("n", "]q", "<CMD>cnext<CR>", opts "Next quickfix item")

-- Buffer navigation
map("n", "<TAB>", "<CMD>bnext<CR>", opts "Next buffer")
map("n", "<S-TAB>", "<CMD>bprev<CR>", opts "Previous buffer")
map("n", "<C-w>b", "<CMD>bd<CR>", opts "Close buffer")
map("n", "<C-z>", "<CMD>bd<CR>", opts "Close buffer")

-- Exit insert mode
map("i", "jk", "<ESC>", opts "Exit insert mode")
map("i", "kj", "<ESC>", opts "Exit insert mode")

-- Window movement
map("n", "<C-Up>", "<C-w>k", opts "Move to window above")
map("n", "<C-Down>", "<C-w>j", opts "Move to window below")
map("n", "<C-Right>", "<C-w>l", opts "Move to window right")
map("n", "<C-Left>", "<C-w>h", opts "Move to window left")

-- Remove Shift+Arrow jumps
map({ "n", "i", "v" }, "<S-Up>", "<Up>", opts "Move cursor up")
map({ "n", "i", "v" }, "<S-Down>", "<Down>", opts "Move cursor down")

-- Search behavior
map("n", "<C-c>", "<CMD>nohlsearch<CR>", opts "Clear search highlight")
map("n", "n", "nzzzv", opts "Center next search match")
map("n", "N", "Nzzzv", opts "Center previous search match")

-- Scrolling
map("n", "<C-d>", "<C-d>zz", opts "Scroll down half a page")
map("n", "<C-u>", "<C-u>zz", opts "Scroll up half a page")

-- Editing
map("n", "<C-y>", "ggVG", opts "Select all")
map("n", "J", "mzJ`z", opts "Join lines")
map("v", "J", ":m '>+1<CR>gv=gv", opts "Move line down")
map("v", "K", ":m '<-2<CR>gv=gv", opts "Move line up")
map("v", ">", ">gv", opts "Indent right")
map("v", "<", "<gv", opts "Indent left")

-- Clipboard
map("x", "<leader>p", '"_dP', opts "Paste without overwriting register")
map("v", "<leader>d", '"_d', opts "Delete without overwriting register")
map("n", "x", '"_x', opts "Delete character without overwriting register")
map("n", "<leader>pc", function() vim.cmd "let @+ = expand('%:p')" end, opts "Copy full path") -- Copy full path

-- Save and Quit
map({ "n", "i", "v" }, "<C-s>", "<ESC><CMD>w!<CR>", opts "Save current buffer")
map({ "n", "i", "v" }, "<C-q>", "<ESC><CMD>qa!<CR>", opts "Quit all")
