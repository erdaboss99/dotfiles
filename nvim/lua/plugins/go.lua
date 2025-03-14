return {
	-- Golang tools
	"olexsmir/gopher.nvim",
	enabled = true,
	ft = "go",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("gopher").setup {
			commands = {
				go = "go",
				gomodifytags = "gomodifytags",
				gotests = "~/go/bin/gotests",
				impl = "impl",
				iferr = "iferr",
			},
		}
	end,
	build = function() vim.cmd [[silent! GoInstallDeps]] end,
}
