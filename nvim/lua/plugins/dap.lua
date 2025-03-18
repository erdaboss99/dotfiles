local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

return {
	-- Debugging tools
	"mfussenegger/nvim-dap",
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
		require("dapui").setup()
		require("dap-go").setup()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-dap-virtual-text").setup {}

		---@diagnostic disable-next-line: missing-fields
		require("dap-vscode-js").setup {
			debugger_path = vim.fn.resolve(vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"),
			adapters = { "pwa-node" },
		}

		for _, language in ipairs { "typescript", "javascript" } do
			require("dap").configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "npm run test:debug (console)",
					runtimeExecutable = "npm",
					runtimeArgs = { "run", "test:debug" },
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

		map("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", opts "Debug toggle breakpoint")
		map("n", "<leader>dt", function() require("dapui").toggle() end, opts "Debug UI toggle")
		map("n", "<leader>dc", "<CMD>DapContinue<CR>", opts "Debug continue")
	end,
}
