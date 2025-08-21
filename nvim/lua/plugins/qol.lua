local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

return {
	{
		-- QOL for commenting
		"echasnovski/mini.comment",
		version = "*",
		event = "BufRead",
		config = function()
			require("mini.comment").setup {
				mappings = { comment = "", comment_line = "<C-_>", comment_visual = "<C-_>" },
			}
		end,
	},
	{
		-- QOL for surrounding text
		"echasnovski/mini.surround",
		version = "*",
		event = "BufRead",
		config = function() require("mini.surround").setup() end,
	},
	{
		-- Hiding sensitive information
		"laytan/cloak.nvim",
		lazy = false,
		config = function()
			require("cloak").setup {
				enabled = true,
				patterns = {
					{ file_pattern = "*.md", cloak_pattern = "=.+" },
					{ file_pattern = "*.env", cloak_pattern = "=.+" },
				},
			}
			map("n", "<leader>tc", "<CMD>CloakToggle<CR>", opts "[T]oggle [C]loak")
			map("n", "<leader>tp", "<CMD>CloakPreviewLine<CR>", opts "[T]oggle Cloak [P]review")
		end,
	},
	{
		-- QoL for keybindings
		"folke/which-key.nvim",
		event = "VimEnter",
		cmd = "WhichKey",
		opts = {
			mappings = vim.g.have_nerd_font,
			spec = {
				{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
				{ "<leader>d", group = "[D]ebug" },
				{ "<leader>f", group = "[F]ind" },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>n", group = "[N]otes" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>y", group = "[Y]ank" },
			},
		},
	},
}
