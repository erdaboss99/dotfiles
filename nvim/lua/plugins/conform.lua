local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

return {
	-- Formatter
	"stevearc/conform.nvim",
	event = "BufWritePre",
	config = function()
		require("conform").setup {
			formatters_by_ft = {
				lua = { "stylua" },

				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				vue = { "prettierd" },
				css = { "prettierd" },
				scss = { "prettierd" },
				less = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				["markdown.mdx"] = { "prettierd" },
				graphql = { "prettierd" },
				handlebars = { "prettierd" },
				svelte = { "prettierd" },
				astro = { "prettierd" },
				htmlangular = { "prettierd" },

				sh = { "shfmt" },
				env = { "shfmt" },

				cs = { "csharpier" },

				go = { "gofumpt", "golines", "goimports-reviser" },
				templ = { "templ" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
			formatters = {
				prettierd = {
					append_args = { "--ignore-path", "./.prettierignore" },
				},
			},
		}

		map("n", "<leader>cf", function() require("conform").format() end, opts "[C]ode [F]ormat")
	end,
}
