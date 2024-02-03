local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
	cmd = "WhichKey",
	opts = {},
}

M.init = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
end

M.config = function()
	local wk = require "which-key"
	wk.register({
		f = {
			name = "[F]ind",
		},
		n = {
			name = "[N]otes",
		},
	}, { prefix = "<leader>" })
end

return M
