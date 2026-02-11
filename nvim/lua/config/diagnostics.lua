local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

local palette = {
	err = "#51202A",
	warn = "#3B3B1B",
	info = "#1F3342",
	hint = "#1E2E1E",
}

vim.api.nvim_set_hl(0, "DiagnosticErrorLine", { bg = palette.err, blend = 20 })
vim.api.nvim_set_hl(0, "DiagnosticWarnLine", { bg = palette.warn, blend = 15 })
vim.api.nvim_set_hl(0, "DiagnosticInfoLine", { bg = palette.info, blend = 10 })
vim.api.nvim_set_hl(0, "DiagnosticHintLine", { bg = palette.hint, blend = 10 })

vim.api.nvim_set_hl(0, "DapStoppedSign", { fg = "#fab387", bg = nil, bold = true })
vim.fn.sign_define("DapStopped", {
	text = "",
	texthl = "DapStoppedSign",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapBreakpoint", {
	text = "●",
	texthl = "DapBreakpoint",
	linehl = "",
	numhl = "",
})

local sev = vim.diagnostic.severity

vim.diagnostic.config {
	-- keep underline & severity_sort on for quick scanning
	underline = true,
	severity_sort = true,
	update_in_insert = false, -- less flicker
	float = {
		border = "rounded",
		source = true,
	},
	-- keep signs & virtual text, but tune them as you like
	signs = {
		text = {
			[sev.ERROR] = " ",
			[sev.WARN] = " ",
			[sev.INFO] = " ",
			[sev.HINT] = "󰌵 ",
		},
	},
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
	},
	linehl = {
		[sev.ERROR] = "DiagnosticErrorLine",
		[sev.WARN] = "DiagnosticWarnLine",
		[sev.INFO] = "DiagnosticInfoLine",
		[sev.HINT] = "DiagnosticHintLine",
	},
}

-- diagnostic keymaps
local diagnostic_goto = function(next, severity)
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function() vim.diagnostic.jump { count = next and 1 or -1, float = true, severity = severity } end
end

map("n", "<leader>cd", vim.diagnostic.open_float, opts "Line diagnostics")
map("n", "]d", diagnostic_goto(true), opts "Next diagnostic")
map("n", "[d", diagnostic_goto(false), opts "Prev diagnostic")
map("n", "]e", diagnostic_goto(true, "ERROR"), opts "Next error")
map("n", "[e", diagnostic_goto(false, "ERROR"), opts "Prev error")
map("n", "]w", diagnostic_goto(true, "WARN"), opts "Next warning")
map("n", "[w", diagnostic_goto(false, "WARN"), opts "Prev warning")
