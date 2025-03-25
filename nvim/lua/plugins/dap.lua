local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

return {
	-- Debugging tools
	"mfussenegger/nvim-dap",
	commit = "90616ae6ae40053103dc66872886fc26b94c70c8",
	dependencies = {
		"leoluz/nvim-dap-go",
		"mxsdev/nvim-dap-vscode-js",
		{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
		"theHamsta/nvim-dap-virtual-text",
		{
			"microsoft/vscode-js-debug",
			build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
			version = "1.*",
		},
	},
	event = "BufRead",
	config = function()
		local dap = require "dap"
		local dapui = require "dapui"
		dapui.setup()
		require("dap-go").setup()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-dap-virtual-text").setup {}

		---@diagnostic disable-next-line: missing-fields
		require("dap-vscode-js").setup {
			debugger_path = vim.fn.resolve(vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"),
			adapters = { "pwa-node" },
		}

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Playwright
		for _, language in ipairs { "typescript", "javascript" } do
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
					internalConsoleOptions = "neverOpen",
				},
			}
		end

		vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#d20f39" })
		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#fab387" })
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })

		map("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", opts "[D]ebug toggle [B]reakpoint")
		map("n", "<leader>dt", function() require("dapui").toggle() end, opts "[D]ebug UI [T]oggle")
		map("n", "<leader>dc", "<CMD>DapContinue<CR>", opts "[D]ebug [C]ontinue")
	end,
}
