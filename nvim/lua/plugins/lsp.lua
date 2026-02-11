-- LSP
local function augroup(name) return vim.api.nvim_create_augroup("user_" .. name, { clear = true }) end

local default_keymaps = {
	{ keys = "<leader>ca", func = vim.lsp.buf.code_action, desc = "Code Actions" },
	{ keys = "<leader>cr", func = vim.lsp.buf.rename, desc = "Code Rename" },
	{ keys = "K", func = function() vim.lsp.buf.hover { border = "rounded" } end, desc = "Hover Documentation" },
	{
		keys = "gd",
		func = require("telescope.builtin").lsp_definitions,
		desc = "Goto Definition",
		has = "definitionProvider",
	},
	{
		keys = "gr",
		func = require("telescope.builtin").lsp_references,
		desc = "Goto References",
		has = "referencesProvider",
	},
	{
		keys = "gi",
		func = require("telescope.builtin").lsp_implementations,
		desc = "Goto Implementations",
		has = "implementationProvider",
	},
	{
		keys = "gt",
		func = require("telescope.builtin").lsp_type_definitions,
		desc = "Goto Type Definitions",
		has = "typeDefinitionProvider",
	},
	{ keys = "H", func = function() vim.diagnostic.open_float { border = "rounded" } end, desc = "Show Diagnostics" },
}

local completion = vim.g.completion_mode or "blink" -- or 'native'
vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup "lsp_attach",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local buf = args.buf
		if client then
			-- Built-in completion
			if completion == "native" and client:supports_method "textDocument/completion" then
				vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			end

			if client:supports_method "textDocument/documentColor" then
				vim.lsp.document_color.enable(true, args.buf, {
					style = "background", -- 'background', 'foreground', or 'virtual'
				})
			end

			for _, km in ipairs(default_keymaps) do
				-- Only bind if there's no `has` requirement, or the server supports it
				if not km.has or client.server_capabilities[km.has] then
					vim.keymap.set(
						km.mode or "n",
						km.keys,
						km.func,
						{ buffer = buf, desc = "LSP: " .. km.desc, nowait = km.nowait }
					)
				end
			end
		end
	end,
})

local biome_folder_rules = {
	{ pattern = "advent-of-code" },
	{ pattern = "packages/test-page-objects" },
	{ pattern = "packages/app-e2e-tests" },
	{ pattern = "packages/design-system-tests" },
}

local function should_use_biome()
	local filepath = vim.fn.expand "%:p"
	for _, rule in ipairs(biome_folder_rules) do
		if string.find(filepath, rule.pattern, 1, true) then return true end
	end
	return false
end

vim.lsp.enable {
	"lua_ls", -- Lua LSP
	"cssls", -- CSS LSP
	"gopls", -- Go LSP
	"jsonls", -- JSON LSP
	"eslint", -- ESLint LSP
	"vtsls", -- Typescript and JavaScript LSP
	"yamlss", -- YAML LSP
	"bashls", -- Bash(Shell) LSP
	"csharp_ls", -- C# LSP
	"html", -- HTML LSP
	"marksman", -- Markdown and MDX LSP
	"taplo", -- TOML LSP
	-- "harper_ls", -- Harper LSP (Spell checking)
}

if should_use_biome() then
	vim.lsp.enable {
		"biome", -- Biome LSP (JavaScript/TypeScript)
	}
end
