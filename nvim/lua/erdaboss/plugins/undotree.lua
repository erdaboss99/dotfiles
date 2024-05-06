local M = {
	"jiaoshijie/undotree",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufReadPre",
}

M.config = function()
	require("undotree").setup {
		float_diff = true,
		layout = "left_bottom",
		position = "left",
		ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
		window = {
			winblend = 0,
		},
		keymaps = {
			["<Down>"] = "move_next",
			["<Up>"] = "move_prev",
			["gj"] = "move2parent",
			["J"] = "move_change_next",
			["K"] = "move_change_prev",
			["<cr>"] = "action_enter",
			["p"] = "enter_diffbuf",
			["q"] = "quit",
		},
	}
    -- stylua: ignore start
    vim.api.nvim_set_keymap( "n", "<leader>tu", "<CMD>lua require('undotree').toggle()<CR>", { desc = "Toggle undo tree", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
