local M = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
	},
}
local packages = function()
	if vim.loop.os_uname().sysname == "Darwin" then
		return {
			"lua-language-server", -- Lua LSP
			"bash-language-server", -- Bash LSP
			"typescript-language-server", -- TypeScript, JavaScript, JSX and TSX LSP
			"astro-language-server", -- Astro LSP
			"emmet-ls", -- Emmet LSP
			"css-lsp", -- CSS LSP
			"html-lsp", -- HTML LSP
			"eslint-lsp", -- ESLint LSP - Linter for JavaScript and TypeScript
			"tailwindcss-language-server", -- TailwindCSS LSP
			"prisma-language-server", -- Prisma ORM LSP
			"json-lsp", -- JSON LSP
			"yaml-language-server", -- YAML LSP
			"marksman", -- Markdown and MDX LSP
			"pyright", -- Python LSP
			{ "csharp-language-server", version = "0.10.0" }, -- C# LSP

			"stylua", -- Lua formatter
			"shfmt", -- Bash formatter
			"prettierd", -- Formatter for Astro, HTML, CSS, Markdown, MDX, JavaScript, TypeScript, JSX, TSX, JSON
			"black", -- Python formatter
			"csharpier", -- C# formatter

			"selene", -- Lua linter
		}
	else
		return {
			"lua-language-server", -- Lua LSP
			"bash-language-server", -- Bash LSP
			"typescript-language-server", -- TypeScript, JavaScript, JSX and TSX LSP
			"eslint-lsp", -- ESLint LSP - Linter for JavaScript and TypeScript
			"json-lsp", -- JSON LSP
			"yaml-language-server", -- YAML LSP
			{ "csharp-language-server", version = "0.10.0" }, -- C# LSP

			"stylua", -- Lua formatter
			"shfmt", -- Bash formatter
			"prettierd", -- Formatter for Astro, HTML, CSS, Markdown, MDX, JavaScript, TypeScript, JSX, TSX, JSON
			"csharpier", -- C# formatter

			"selene", -- Lua linter
		}
	end
end

M.config = function()
	require("mason-tool-installer").setup {
		ensure_installed = packages(),
	}
end

return M
