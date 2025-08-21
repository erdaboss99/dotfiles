local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

local folder_rules = {
	{ pattern = "frontend%.git/.*/packages/tests", formatter = { "biome" } },
	{ pattern = "frontend/packages/tests", formatter = { "biome" } },
}

local function pick_formatter(bufnr)
	local filepath = vim.api.nvim_buf_get_name(bufnr)
	for _, rule in ipairs(folder_rules) do
		if filepath:match(rule.pattern) then return rule.formatter end
	end
	return { "prettierd" } -- default if nothing matches
end

return {
	-- Formatter
	"stevearc/conform.nvim",
	event = "BufWritePre",
	config = function()
		require("conform").setup {
			formatters_by_ft = {
				lua = { "stylua" },

				javascript = pick_formatter,
				javascriptreact = pick_formatter,
				typescript = pick_formatter,
				typescriptreact = pick_formatter,
				json = pick_formatter,
				jsonc = pick_formatter,

				vue = { "prettierd" },
				css = { "prettierd" },
				scss = { "prettierd" },
				less = { "prettierd" },
				html = { "prettierd" },
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
