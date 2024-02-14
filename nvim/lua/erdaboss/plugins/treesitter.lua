local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
}

M.config = function()
	require("nvim-treesitter.install").compilers = { "clang", "gcc" }
	local config = require "nvim-treesitter.configs"
	vim.treesitter.language.register("markdown", "mdx")

	local parsers = function()
		if vim.loop.os_uname().sysname == "Darwin" then
			return {
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
				"python",
				"markdown",
				"markdown_inline",
				"toml",
				"csv",
				"bibtex",
				"latex",
			}
		else
			return {
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
				"tsx",
				"toml",
				"csv",
			}
		end
	end

	config.setup {
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		ensure_installed = parsers(),
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-Space>",
				node_incremental = "<TAB>",
				node_decremental = "<S-TAB>",
			},
		},
	}
end

return M
