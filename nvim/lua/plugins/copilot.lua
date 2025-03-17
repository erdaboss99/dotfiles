return {
	-- Github Copilot
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	config = function()
		require("copilot").setup {
			suggestion = { enable = false },
			panel = { enable = false },
			filetypes = {
				yaml = true,
				markdown = true,
				gitcommit = true,
				gitrebase = true,
			},
		}
	end,
}
