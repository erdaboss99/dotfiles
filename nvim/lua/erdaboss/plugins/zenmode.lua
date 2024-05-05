local M = {
	"folke/zen-mode.nvim",
	event = "BufRead",
	opts = {},
}

M.config = function()
    -- stylua: ignore start
    vim.api.nvim_set_keymap( "n", "<leader>z", "<CMD>ZenMode<CR>", { desc = "Zen Mode", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
