return {
	-- Github Copilot
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	config = function()
		require("copilot").setup {
			suggestion = { enable = false },
			panel = { enable = false },
		}
	end,
}
