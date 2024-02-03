local M = {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
}

M.config = function()
	require("copilot").setup {
		suggestion = {
			enable = false,
		},
		panel = {
			enable = false,
		},
	}
end
return M
