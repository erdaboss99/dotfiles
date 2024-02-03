local M = {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
}

M.config = function()
	require("catppuccin").setup {
		transparent_background = true,
	}
	vim.cmd.colorscheme "catppuccin-mocha"
	-- vim.cmd.colorscheme "catppuccin-frappe"
end

return M
