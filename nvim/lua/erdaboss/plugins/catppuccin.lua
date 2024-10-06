local M = {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
}

M.config = function()
	require("catppuccin").setup {
		transparent_background = false,
	}
	vim.cmd.colorscheme "catppuccin-mocha"
end

return M
