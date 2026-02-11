local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

local dap = require "dap"
local dapui = require "dapui"
dapui.setup()

-- Go
require("dap-go").setup()

-- Typescript and JavaScript
require("dap-vscode-js").setup {
	debugger_path = vim.fn.expand "$HOME/vscode-js-debug",
	adapters = { "pwa-node" },
}

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open {} end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close {} end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close {} end
dap.listeners.before.disconnect["dapui_config"] = function() dapui.close {} end

require("nvim-dap-virtual-text").setup {}

-- Playwright
for _, language in ipairs { "typescript", "typescriptreact", "javascript" } do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Test PW Test with test:debug tag",
			runtimeExecutable = "npx",
			runtimeArgs = {
				"playwright",
				"test",
				"--config=./src/configuration/playwright.config.ts",
				"--grep",
				"test@debug",
				"--retries=0",
				"--trace=on",
				"--project=Desktop Chrome",
				"--debug",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			skipFiles = { "<node_internals>/**" },
			internalConsoleOptions = "neverOpen",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Test PW Component Test with test:debug tag",
			runtimeExecutable = "pnpm",
			runtimeArgs = {
				"exec",
				"playwright",
				"test",
				"--config=./playwright-ct.config.ts",
				"--grep",
				"test@debug",
				"--retries=0",
				"--trace=on",
				"--project=Desktop Chrome",
				"--debug",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			skipFiles = { "<node_internals>/**" },
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end

map("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", opts "Debug toggle breakpoint")
map("n", "<leader>dt", function() require("dapui").toggle() end, opts "Debug ui toggle")
map("n", "<leader>dc", "<CMD>DapContinue<CR>", opts "Debug continue")
