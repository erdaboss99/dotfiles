local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
}

M.config = function()
	local lspconf = require "lspconfig"

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local on_attach = function(_, bufnr)
        -- stylua: ignore start
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation", buffer = bufnr })
        vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "[G]o to [D]efinition", buffer = bufnr })
        vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]o to [R]eferences", buffer = bufnr })
        vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions, { desc = "[G]o to [T]ype definitions", buffer = bufnr })
        vim.keymap.set("n", "ge", function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "[G]o to [E]rrors", buffer = bufnr })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", buffer = bufnr })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction", buffer = bufnr })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame", buffer = bufnr })
		-- stylua: ignore end
	end

	-- Lua LSP
	lspconf.lua_ls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	}

	-- TypeScript, JavaScript, JSX and TSX LSP
	lspconf.tsserver.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- ESLint LSP
	lspconf.eslint.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- JSON LSP
	lspconf.jsonls.setup {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	-- YAML LSP
	lspconf.yamlls.setup {
		capabilities = capabilities,
		on_attach = on_attach,
	}

	-- TOML LSP
	lspconf.taplo.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- Bash (Shell) LSP
	lspconf.bashls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- C# LSP
	lspconf.csharp_ls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if vim.loop.os_uname().sysname == "Darwin" then
		-- Astro LSP
		lspconf.astro.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- HTML LSP
		lspconf.html.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- CSS LSP
		lspconf.cssls.setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				css = {
					validate = true,
					lint = { unknownAtRules = "ignore" },
				},
				scss = {
					validate = true,
					lint = { unknownAtRules = "ignore" },
				},
				less = {
					validate = true,
					lint = { unknownAtRules = "ignore" },
				},
			},
		}

		-- TailwindCSS LSP
		lspconf.tailwindcss.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- Markdown and MDX LSP
		lspconf.marksman.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- Prisma ORM LSP
		lspconf.prismals.setup {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- Python LSP
		lspconf.pyright.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"python",
			},
		}

		-- Go LSP
		lspconf.gopls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = {
				"go",
				"gomod",
				"gowork",
				"gotmpl",
			},
			settings = {
				gopls = {
					completeUnimported = true,
					analyses = {
						ununsedparams = true,
					},
				},
			},
		}
	end
end

return M
