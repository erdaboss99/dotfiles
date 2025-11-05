local map = vim.keymap.set
local opts = function(desc, buffnr)
	return { desc = desc, buffer = buffnr, noremap = true, silent = true, nowait = true }
end

return {
	-- LSP Config
	"neovim/nvim-lspconfig",
	dependencies = {
		"b0o/schemastore.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconf = require "lspconfig"
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local on_attach = function(client, bufnr)
			map("n", "K", vim.lsp.buf.hover, opts("Show documentation", bufnr))
			map("n", "gd", require("telescope.builtin").lsp_definitions, opts("LSP go to definition", bufnr))
			map("n", "gr", require("telescope.builtin").lsp_references, opts("LSP go to references", bufnr))
			map("n", "gi", require("telescope.builtin").lsp_implementations, opts("LSP go to implementations", bufnr))
			map("n", "gt", require("telescope.builtin").lsp_type_definitions, opts("LSP go to type definitions", bufnr))
			map(
				"n",
				"H",
				function() vim.diagnostic.open_float { border = "rounded" } end,
				opts("LSP show error", bufnr)
			)
			map("n", "[d", vim.diagnostic.goto_prev, opts("LSP go to previous diagnostic", bufnr))
			map("n", "]d", vim.diagnostic.goto_next, opts("LSP go to next diagnostic", bufnr))
			map("n", "<leader>ca", vim.lsp.buf.code_action, opts("[C]ode [A]ction", bufnr))
			map("n", "<leader>cr", vim.lsp.buf.rename, opts("[C]ode [R]ename", bufnr))

			if client.name == "gopls" and not client.server_capabilities.semanticTokensProvider then
				local semantic = client.config.capabilities.textDocument.semanticTokens
				client.server_capabilities.semanticTokensProvider = {
					full = true,
					legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
					range = true,
				}
			end
		end

		-- Lua LSP
		lspconf.lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = { Lua = { diagnostics = { globals = { "vim" } } } },
		}

		local mason_registry = require "mason-registry"
		local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
			.. "/node_modules/@vue/language-server"

		-- TypeScript, JavaScript, JSX and TSX LSP
		lspconf.ts_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			-- only when using vue, sadly if the vue plugin is being used, ts_ls will be slow af
			-- init_options = {
			-- 	plugins = {
			-- 		{
			-- 			name = "@vue/typescript-plugin",
			-- 			location = vue_language_server_path,
			-- 			languages = { "javascript", "typescript", "vue" },
			-- 		},
			-- 	},
			-- },
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		}

		-- CSS LSP
		lspconf.cssls.setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				css = { validate = true, lint = { unknownAtRules = "ignore" } },
				scss = { validate = true, lint = { unknownAtRules = "ignore" } },
				less = { validate = true, lint = { unknownAtRules = "ignore" } },
			},
		}

		-- Go LSP
		lspconf.gopls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			settings = {
				gopls = {
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							semanticTokens = true,
						},
					},
				},
			},
		}

		-- JSON LSP
		lspconf.jsonls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		}

		local default_servers = {
			"eslint", -- ESLint LSP
			"biome", -- Biome LSP
			"yamlls", -- YAML LSP
			"bashls", -- Bash (Shell) LSP
			"csharp_ls", -- C# LSP
			"html", -- HTML LSP
			"marksman", -- Markdown and MDX LSP
			-- "volar", -- Vue LSP
			-- "taplo", -- TOML LSP
			-- "tailwindcss", -- TailwindCSS LSP
			-- "astro", -- Astro LSP
			-- "prismals", -- Prisma ORM LSP
		}
		for _, server in pairs(default_servers) do
			require("lspconfig")[server].setup { on_attach = on_attach, capabilities = capabilities }
		end
	end,
}
