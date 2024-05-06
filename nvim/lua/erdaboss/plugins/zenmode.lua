local M = {
	"folke/zen-mode.nvim",
	event = "BufRead",
	opts = {},
}

M.config = function()
    -- stylua: ignore start
    vim.api.nvim_set_keymap( "n", "<leader>tz", "<CMD>ZenMode<CR>", { desc = "Toggle Zen mode", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
