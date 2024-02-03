local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufRead",
	main = "ibl",
	opts = {
		indent = {
			tab_char = "",
		},
		exclude = {
			filetypes = {
				"lspinfo",
				"checkhealth",
				"help",
				"man",
				"gitcommit",
				"lazy",
				"TelescopePrompt",
				"TelescopeResults",
				"mason",
				"",
			},
		},
		scope = {
			enabled = false,
		},
	},
}

M.config = function(_, opts) require("ibl").setup(opts) end

return M
