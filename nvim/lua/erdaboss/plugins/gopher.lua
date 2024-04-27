local M = {
	"olexsmir/gopher.nvim",
	enable = vim.loop.os_uname().sysname == "Darwin",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}

M.config = function()
	require("gopher").setup {
		commands = {
			go = "go",
			gomodifytags = "gomodifytags",
			gotests = "~/go/bin/gotests",
			impl = "impl",
			iferr = "iferr",
		},
	}
end

return M
