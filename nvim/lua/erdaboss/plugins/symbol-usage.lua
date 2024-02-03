local M = {
	"Wansmer/symbol-usage.nvim",
	event = "BufReadPre",
}

M.config = function() require("symbol-usage").setup() end

return M
