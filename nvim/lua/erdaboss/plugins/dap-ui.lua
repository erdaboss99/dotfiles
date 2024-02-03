local M = {
	"rcarriga/nvim-dap-ui",
	-- event = "BufEnter *.js,*.ts,*.cpp",
	event = "BufEnter *.js,*.ts",
	depends = { "mfussenegger/nvim-dap" },
}

M.config = function()
	local dap = require "dap"
	local dapui = require "dapui"
	require("dapui").setup()

	dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
	dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
	dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

	-- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>dr", "<CMD>DapContinue<CR>", { desc = "Run or Continue the debugger", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>ds", "<CMD>DapStepOver<CR>", { desc = "Step over a breakpoint", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
