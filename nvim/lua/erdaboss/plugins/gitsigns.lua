local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufRead",
}
M.config = function()
	require("gitsigns").setup {
		on_attach = function(bufnr)
			local gitsigns = require "gitsigns"
            -- stylua: ignore start
			vim.keymap.set("n", "[c", "<CMD>Gitsigns prev_hunk<CR>", { desc = "Go previous git change hunk", buffer = bufnr })
			vim.keymap.set("n", "]c", "<CMD>Gitsigns next_hunk<CR>", { desc = "Go next git change hunk", buffer = bufnr })
            vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle deleted hunks", buffer = bufnr })
			-- stylua: ignore end
		end,
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "󰍵" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "│" },
		},
		current_line_blame = true,
	}
end

return M
