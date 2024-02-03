-- stylua: ignore start
vim.api.nvim_set_keymap("n", "<Char-0xAA>", "<CMD>w!<CR>", { desc = "Save current buffer", noremap = true, silent = true, nowait = true }) -- <CMD-s>
vim.api.nvim_set_keymap("i", "<Char-0xAA>", "<ESC><CMD>w!<CR>", { desc = "Save current buffer", noremap = true, silent = true, nowait = true }) -- <CMD-s>
vim.api.nvim_set_keymap("v", "<Char-0xAA>", "<ESC><CMD>w!<CR>", { desc = "Save current buffer", noremap = true, silent = true, nowait = true }) -- <CMD-s>

vim.api.nvim_set_keymap("n", "<C-s>", "<CMD>w!<CR>", { desc = "Save current buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC><CMD>w!<CR>", { desc = "Save current buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<C-s>", "<ESC><CMD>w!<CR>", { desc = "Save current buffer", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<C-q>", "<CMD>qa!<CR>", { desc = "Quit all", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "<C-q>", "<ESC><CMD>qa!<CR>", { desc = "Quit all", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<C-q>", "<ESC><CMD>qa!<CR>", { desc = "Quit all", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<TAB>", "<CMD>bnext<CR>", { desc = "Next buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", "<CMD>bprev<CR>", { desc = "Previous buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<C-w>b", "<CMD>bd<CR>", { desc = "Close buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { desc = "Exit from insert mode", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "kj", "<ESC>", { desc = "Exit from insert mode", noremap = true, silent = true, nowait = true })

-- Remove Shift+Arrow keys jumps
vim.api.nvim_set_keymap("n", "<S-Up>", "<Up>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<S-Down>", "<Down>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "<S-Up>", "<Up>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "<S-Down>", "<Down>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<S-Up>", "<Up>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<S-Down>", "<Down>", { noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<C-c>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { desc = "Keep next search term centered", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { desc = "Keep previous search term centered", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "H", "^", { desc = "Jump to the first non-blank character of the line", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "L", "$", { desc = "Jump to the last character of the line", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<C-y>", "ggVG", { desc = "Select all", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "yw", "yiw", { desc = "Yank current word", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "dw", "diw", { desc = "Delete current word", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "cw", "ciw", { desc = "Change current word", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "x", '"_x', { desc = "Delete character without saving into register", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "J", "mzJ`z", { desc = "Join lines", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up", noremap = true, silent = true, nowait = true })
-- stylua: ignore end
