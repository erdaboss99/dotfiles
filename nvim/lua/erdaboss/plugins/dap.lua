local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		{ "rcarriga/nvim-dap-ui", dependencies = {
			"nvim-neotest/nvim-nio",
		} },
		"theHamsta/nvim-dap-virtual-text",
	},
	event = "VeryLazy",
}

M.config = function()
	require("dapui").setup()
	require("dap-go").setup()
	require("nvim-dap-virtual-text").setup {}
	local dap, dapui = require "dap", require "dapui"

	dap.listeners.before.attach.dapui_config = function() dapui.open() end
	dap.listeners.before.launch.dapui_config = function() dapui.open() end
	dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
	dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -- stylua: ignore start
	vim.api.nvim_set_keymap("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", { desc = "[D]ebug [B]reakpoint", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap("n", "<leader>dc", "<CMD>DapContinue<CR>", { desc = "[D]ebug [C]ontinue", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap("n", "<leader>dt", "<CMD>DapTerminate<CR>", { desc = "[D]ebug [T]erminate", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap("n", "<leader>ds", "<CMD>DapStepOver<CR>", { desc = "[D]ebug [S]tep over", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
