local M = {
	"kdheepak/lazygit.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

M.config = function()
	-- stylua: ignore
	vim.api.nvim_set_keymap( "n", "<leader>lg", "<CMD>LazyGit<CR>", { desc = "Open [L]azy[G]it", noremap = true, silent = true, nowait = true })
end

return M
