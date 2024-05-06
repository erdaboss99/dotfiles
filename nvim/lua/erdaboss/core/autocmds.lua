vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function() vim.highlight.on_yank { higroup = "Visual", timeout = 200 } end,
})

vim.api.nvim_create_augroup("MarkdownConceal", {
	clear = true,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = "MarkdownConceal",
	pattern = "markdown",
	command = "setlocal conceallevel=2",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"netrw",
		"Jaq",
		"qf",
		"git",
		"help",
		"man",
		"lspinfo",
		"lir",
		"tsplayground",
		"",
	},
	callback = function()
		vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
	end,
})
