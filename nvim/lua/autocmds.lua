-- Global autocmds

-- Highlight yanked text
vim.api.nvim_create_autocmd(
	{ "TextYankPost" },
	{ callback = function() vim.highlight.on_yank { higroup = "Visual", timeout = 200 } end }
)

-- Set conceallevel for markdown files
vim.api.nvim_create_augroup("MarkdownConceal", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = "MarkdownConceal",
	pattern = "markdown",
	command = "setlocal conceallevel=2",
})

-- Set fileformat for shell scripts
vim.api.nvim_create_augroup("ShellFileFormat", { clear = true })
vim.api.nvim_create_autocmd(
	{ "FileType" },
	{ group = "ShellFileFormat", pattern = "sh", command = "setlocal fileformat=unix" }
)

-- Set quick close mappings for various filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "netrw", "Jaq", "qf", "git", "help", "man", "lspinfo", "lir", "tsplayground", "" },
	callback = function() vim.cmd [[ nnoremap <silent> <buffer> q :close<CR> set nobuflisted ]] end,
})

local group = vim.api.nvim_create_augroup("__env", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = ".env",
	group = group,
	callback = function(args) vim.diagnostic.enable(false, args.buf) end,
})
