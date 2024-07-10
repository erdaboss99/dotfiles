local M = {
	"olexsmir/gopher.nvim",
	enabled = true,
	ft = "go",
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
	-- stylua: ignore
	vim.api.nvim_set_keymap( "n", "<leader>jg", "<CMD>GoTagAdd json<CR>", { desc = "Add Go Struct JSON Tags", noremap = true, silent = true, nowait = true })
end

M.build = function() vim.cmd [[silent! GoInstallDeps]] end

return M
