local M = {
	"nvimtools/none-ls.nvim",
	event = "BufEnter",
}

M.config = function()
	local null_ls = require "null-ls"
	-- Format on save
	local lsp_formatting = function(bufnr)
		vim.lsp.buf.format {
			timeout_ms = 5000,
			filter = function(client) return client.name == "null-ls" end,
			bufnr = bufnr,
		}
	end
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local sources = function()
		if vim.loop.os_uname().sysname == "Darwin" then
			return {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.selene,
				null_ls.builtins.formatting.prettierd.with {
					extra_filetypes = { "astro", "prisma" },
					disabled_filetypes = { "markdown" },
					extra_args = { "--ignore-path", "./.prettierignore" },
				},
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.csharpier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.golines,
			}
		else
			return {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.selene,
				null_ls.builtins.formatting.prettierd.with {
					extra_filetypes = { "astro", "prisma" },
					disabled_filetypes = { "markdown" },
					extra_args = { "--ignore-path", "./.prettierignore" },
				},
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.csharpier,
			}
		end
	end

	null_ls.setup {
		sources = sources(),
		on_attach = function(client, bufnr)
			if client.supports_method "textDocument/formatting" then
				vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function() lsp_formatting(bufnr) end,
				})
			end
		end,
	}
end

return M
