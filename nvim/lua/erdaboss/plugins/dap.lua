local M = {
	"mfussenegger/nvim-dap",
}

M.config = function()
	local dap = require "dap"

	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = "8123",
		executable = {
			command = "js-debug-adapter",
		},
	}

	dap.configurations.typescript = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
		},
	}
	dap.configurations.javascript = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			runtimeExecutable = "node",
		},
	}

	-- dap.adapters.lldb = {
	-- 	type = "executable",
	-- 	command = "lldb-vscode",
	-- 	name = "lldb",
	-- }
	--
	-- dap.configurations.cpp = {
	-- 	{
	-- 		name = "Launch",
	-- 		type = "lldb",
	-- 		request = "launch",
	-- 		program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
	-- 		cwd = "${workspaceFolder}",
	-- 		stopOnEntry = false,
	-- 		args = {},
	-- 	},
	-- }
end

return M
