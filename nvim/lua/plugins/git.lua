local map = vim.keymap.set
local opts = function(desc, buffnr)
	return { desc = desc, buffer = buffnr, noremap = true, silent = true, nowait = true }
end

return {
	{ -- QoL Git commands and icon in the signcol
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup {
				on_attach = function(bufnr)
					local gitsigns = require "gitsigns"
					map("n", "[c", "<CMD>Gitsigns prev_hunk<CR>", opts("Go to previous git change hunk", bufnr))
					map("n", "]c", "<CMD>Gitsigns next_hunk<CR>", opts("Go to next git change hunk", bufnr))
					map("n", "<leader>td", gitsigns.preview_hunk_inline, opts("Toggle deleted hunks", bufnr))
					map("n", "<leader>tb", gitsigns.toggle_current_line_blame, opts("Toggle current line blame", bufnr))
					map("n", "<leader>tl", gitsigns.toggle_linehl, opts("Toggle line highlight", bufnr))
				end,
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "󰍵" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "│" },
				},
			}
		end,
	},
}
