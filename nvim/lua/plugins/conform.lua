local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

local folder_rules = {
	{ pattern = "advent-of-code", formatter = { "biome" } },
	{ pattern = "packages/test-page-objects", formatter = { "biome" } },
	{ pattern = "packages/app-e2e-tests", formatter = { "biome" } },
	{ pattern = "packages/design-system-tests", formatter = { "biome" } },
}

local function pick_formatter(bufnr)
	local filepath = vim.api.nvim_buf_get_name(bufnr)
	for _, rule in ipairs(folder_rules) do
		if string.find(filepath, rule.pattern, 1, true) then return rule.formatter end
	end
	return { "prettierd" } -- default if nothing matches
end

require("conform").setup {
	formatters_by_ft = {
		lua = { "stylua" },

		javascript = pick_formatter,
		javascriptreact = pick_formatter,
		typescript = pick_formatter,
		typescriptreact = pick_formatter,
		json = pick_formatter,
		jsonc = pick_formatter,
		html = pick_formatter,
		vue = pick_formatter,

		css = { "prettierd" },
		scss = { "prettierd" },
		less = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		["markdown.mdx"] = { "prettierd" },

		sh = { "shfmt" },
		env = { "shfmt" },

		cs = { "csharpier" },

		go = { "gofumpt", "golines", "goimports-reviser" },

		["_"] = { "trim_whitespace" },
	},
	format_on_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if bufname:match "/node_modules/" then return end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
	formatters = {
		prettierd = {
			append_args = { "--ignore-path", "./.prettierignore" },
		},
	},
}

vim.api.nvim_create_user_command("FormatDisable", function(opt)
	if opt.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
	vim.notify("Autoformat disabled" .. (opt.bang and " (buffer)" or " (global)"), vim.log.levels.WARN)
end, { desc = "Disable autoformat-on-save", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
	vim.notify("Autoformat enabled", vim.log.levels.INFO)
end, { desc = "Re-enable autoformat-on-save" })

local auto_format = true

map("n", "<leader>tf", function()
	auto_format = not auto_format
	if auto_format then
		vim.cmd "FormatEnable"
	else
		vim.cmd "FormatDisable"
	end
end, opts "Toggle autoformat")

map({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ async = true }, function(err, did_edit)
		if not err and did_edit then vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" }) end
	end)
end, opts "Code format")
