local M = {
	"echasnovski/mini.surround",
	version = "*",
	event = "BufRead",
}

M.config = function() require("mini.surround").setup() end

return M
