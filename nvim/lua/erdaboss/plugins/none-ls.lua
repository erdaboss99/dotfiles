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

	null_ls.setup {
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.diagnostics.luacheck.with {
				extra_args = { "--ignore", "542" },
			},

			null_ls.builtins.formatting.prettierd.with {
				extra_filetypes = { "astro", "prisma" },
				disabled_filetypes = { "markdown" },
				extra_args = { "--ignore-path", "./.prettierignore" },
			},

			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.diagnostics.shellcheck.with {
				disabled_filetypes = { "dotenv" },
			},

			null_ls.builtins.formatting.csharpier,

			null_ls.builtins.formatting.autopep8,
			null_ls.builtins.diagnostics.flake8.with {
				extra_args = { "--ignore=E501" },
			},

			null_ls.builtins.formatting.taplo,

			null_ls.builtins.formatting.trim_whitespace.with {
				filetypes = { "*" },
			},
		},
		on_attach = function(client, bufnr)
			if client.supports_method "textDocument/formatting" then
				vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function() lsp_formatting(bufnr) end,
				})
			end
			vim.keymap.set("i", "<C-f>", vim.lsp.buf.format, { desc = "Format current buffer" })
			vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, { desc = "Format current buffer" })
		end,
	}
end

return M
