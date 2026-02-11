local function augroup(name) return vim.api.nvim_create_augroup("user_" .. name, { clear = true }) end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup "checktime",
	callback = function()
		if vim.o.buftype ~= "nofile" then vim.cmd "checktime" end
	end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup "resize_splits",
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd "tabdo wincmd ="
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup "highlight_yank",
	callback = function() (vim.hl or vim.highlight).on_yank { higroup = "Visual", timeout = 200 } end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup "close_with_q",
	pattern = { "netrw", "Jaq", "qf", "git", "help", "man", "lspinfo", "lir", "tsplayground", "" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd "close"
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup "wrap_spell",
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function() vim.opt_local.wrap = true end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup "json_conceal",
	pattern = { "json", "jsonc", "json5" },
	callback = function() vim.opt_local.conceallevel = 0 end,
})

-- Fix conceallevel for markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup "markdown_conceal",
	pattern = "markdown",
	callback = function() vim.opt_local.conceallevel = 2 end,
})

-- Set filetype for .env and .env.* files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup "env_filetype",
	pattern = { "*.env", ".env.*" },
	callback = function()
		vim.opt_local.filetype = "sh"
		vim.diagnostic.enable(false)
	end,
})
