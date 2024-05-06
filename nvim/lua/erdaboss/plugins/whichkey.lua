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
			name = "+Find",
		},
		n = {
			name = "+Notes",
		},
		t = {
			name = "+Toggle",
		},
		d = {
			name = "+Debug",
		},
	}, { prefix = "<leader>" })
end

return M
