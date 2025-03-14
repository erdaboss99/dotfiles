return {
	-- Syntax highlighting and parsing
	"nvim-treesitter/nvim-treesitter",
	event = { "VeryLazy" },
	build = ":TSUpdate",
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	config = function()
		require("nvim-treesitter.install").compilers = { "clang", "gcc" }
		local config = require "nvim-treesitter.configs"
		vim.treesitter.language.register("markdown", "mdx")
		config.setup {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"bash",
				"javascript",
				"typescript",
				"json",
				"jsonc",
				"yaml",
				"c_sharp",
				"html",
				"css",
				"astro",
				"tsx",
				"go",
				"gomod",
				"markdown",
				"markdown_inline",
				"toml",
				"csv",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-Space>",
					node_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
		}
	end,
}
