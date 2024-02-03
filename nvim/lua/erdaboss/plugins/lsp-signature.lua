local M = {
	"ray-x/lsp_signature.nvim",
	event = "BufReadPre",
	opts = {
		bind = true,
		handler_opts = {
			border = "rounded",
		},
		hint_enable = false,
	},
}
M.config = function(_, opts) require("lsp_signature").setup(opts) end

return M
