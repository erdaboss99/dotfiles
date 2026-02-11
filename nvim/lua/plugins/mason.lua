require("mason").setup {
	ui = { border = "rounded" },
}

require("mason-tool-installer").setup {
	ensure_installed = {
		"lua-language-server", -- Lua LSP
		"bash-language-server", -- Bash LSP
		"typescript-language-server", -- TypeScript, JavaScript, JSX and TSX LSP
		"vtsls", -- TypeScript, JavaScript, JSX and TSX LSP
		"css-lsp", -- CSS LSP
		"html-lsp", -- HTML LSP
		"eslint-lsp", -- ESLint LSP - Linter for JavaScript and TypeScript
		"biome", -- Biome Linter and Formatter for JavaScript and TypeScript
		"shellcheck", -- Shell Linter
		"json-lsp", -- JSON LSP
		"yaml-language-server", -- YAML LSP
		"marksman", -- Markdown and MDX LSP
		{ "csharp-language-server", version = "0.10.0" }, -- C# LSP
		"gopls", -- Go LSP
		"taplo", -- TOML LSP
		"vue-language-server", -- Vue LSP
		"stylua", -- Lua formatter
		"shfmt", -- Bash formatter
		"prettierd", -- Formatter for Astro, HTML, CSS, Markdown, MDX, JavaScript, TypeScript, JSX, TSX, JSON
		"csharpier", -- C# formatter
		"gofumpt", -- Go formatter
		"goimports-reviser", -- Go imports formatter
		"golines", -- Go lines formatter
		"harper-ls", -- Spell checker LSP
	},
}
