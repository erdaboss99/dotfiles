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
					map("n", "<leader>gd", gitsigns.preview_hunk_inline, opts("[G]it show [D]eleted hunks", bufnr))
					map("n", "<leader>gl", gitsigns.toggle_linehl, opts("[G]it [H]ighlight changes", bufnr))
					map("n", "<leader>gb", gitsigns.blame, opts("[G]it [B]lame", bufnr))
				end,
				current_line_blame = true,
				word_diff = true,
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

	{ -- Git management in Neovim
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "[G]it Lazy[G]it" },
		},
	},
}
