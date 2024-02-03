local M = {

	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
}

M.config = function()
	require("toggleterm").setup {
		open_mapping = [[<C-t>]],
		direction = "float",
	}
end

return M
