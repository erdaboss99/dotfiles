local M = {
	"onsails/lspkind.nvim", -- Pictogram library
}

M.config = function()
	require("lspkind").init {
		symbol_map = {
			Copilot = "",
		},
	}
end

return M
