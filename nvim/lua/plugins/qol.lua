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
			map("n", "<leader>tc", "<CMD>CloakToggle<CR>", opts "Toggle cloak")
		end,
	},
	{
		-- QoL for keybindings
		"folke/which-key.nvim",
		event = "VeryLazy",
		cmd = "WhichKey",
		opts = {},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
}
