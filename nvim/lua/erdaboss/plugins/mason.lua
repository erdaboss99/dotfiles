local M = {
	"williamboman/mason.nvim",
	cmd = {
		"Mason",
		"MasonInstall",
		"MasonInstallAll",
		"MasonUpdate",
	},
}

M.config = function() require("mason").setup() end

return M
