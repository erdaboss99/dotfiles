local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	enabled = true,
	config = function()
		local harpoon = require "harpoon"
		harpoon:setup()

		map("n", "<leader>a", function() harpoon:list():add() end, opts "Harpoon [A]dd file")
		map("n", "<leader>r", function() harpoon:list():remove() end, opts "Harpoon [R]emove file")
		map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts "Open Harpoon [E]xplorer")
	end,
}
