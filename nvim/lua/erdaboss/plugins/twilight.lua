local M = {
	"folke/twilight.nvim",
	event = "BufRead",
	opts = {
		context = 20,
		expand = {
			"function",
			"function_definition",
			"function_item",
			"method",
			"method_definition",
			"table",
			"if_statement",
		},
	},
}

M.config = function()
    -- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<leader>tt", "<CMD>Twilight<CR>", { desc = "Toggle Twilight", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
