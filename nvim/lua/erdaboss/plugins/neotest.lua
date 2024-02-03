local M = {
	"nvim-neotest/neotest",
	event = "BufEnter *.spec.ts",
	dependencies = {
		"thenbe/neotest-playwright",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}

M.config = function()
	require("neotest").setup {
		adapters = {
			require("neotest-playwright").adapter {
				options = {
					preset = "none", -- "none" | "headed" | "debug"
					persist_project_selection = false,
					enable_dynamic_test_discovery = false,

					filter_dir = function(name) return name ~= "node_modules" end,
				},
			},
		},
		icons = {
			passed = "",
			running = "",
			failed = "",
			unknown = "",
			-- passed = " ",
			-- running = "",
			-- failed = " ",
			-- unknown = " ",
		},
	}

	-- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<leader>tp", "<CMD>NeotestPlaywrightProject<CR>", { desc = "Change project config", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>tP", "<CMD>NeotestPlaywrightPreset<CR>", { desc = "Change preset", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>tr", "<CMD>NeotestPlaywrightRefresh<CR>", { desc = "Refresh project", noremap = true, silent = true, nowait = true })

	vim.api.nvim_set_keymap( "n", "<leader>tt", function() require("neotest").run.run(vim.fn.expand "%") end, { desc = "Run file", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end, { desc = "Run all test files", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Run nearest test", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "Attach", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>to", function() require("neotest").output_panel.toggle() end, { desc = "Toggle output panel", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Stop", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle summary", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
