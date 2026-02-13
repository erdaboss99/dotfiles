local map = vim.keymap.set
local opts = function(desc, buffnr)
	return { desc = desc, buffer = buffnr, noremap = true, silent = true, nowait = true }
end

require("gitsigns").setup {
	on_attach = function(bufnr)
		local gitsigns = require "gitsigns"
		map("n", "[c", "<CMD>Gitsigns prev_hunk<CR>", opts("Go to previous git change hunk", bufnr))
		map("n", "]c", "<CMD>Gitsigns next_hunk<CR>", opts("Go to next git change hunk", bufnr))
		map("n", "<leader>gd", gitsigns.preview_hunk_inline, opts("Git show deleted hunks", bufnr))
		map("n", "<leader>gl", gitsigns.toggle_linehl, opts("Git highlight changes", bufnr))
		map("n", "<leader>gb", gitsigns.blame, opts("Git blame", bufnr))
		map("n", "<leader>gw", gitsigns.toggle_word_diff, opts("Git word diff", bufnr))
	end,
	current_line_blame = true,
	word_diff = false,
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "󰍵" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "│" },
	},
}
