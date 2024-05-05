local M = {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}

M.config = function()
	require("lspsaga").setup {
		lightbulb = {
			enable = false,
		},
		beacon = {
			enable = false,
		},
	}
end

return M
