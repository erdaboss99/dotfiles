local M = {
	"laytan/cloak.nvim",
	lazy = false,
}

M.config = function()
	require("cloak").setup {
		enabled = true,
		patterns = {
			{
				file_pattern = "*.env",
				cloak_pattern = "=.+",
			},
		},
	}

    -- stylua: ignore start
    vim.api.nvim_set_keymap( "n", "<leader>tc", "<CMD>CloakToggle<CR>", { desc = "Toggle cloak", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
