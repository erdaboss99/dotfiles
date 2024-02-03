local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
}
M.config = function()
	require("gitsigns").setup {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "󰍵" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "│" },
		},
		current_line_blame = true,
	}
end

return M
