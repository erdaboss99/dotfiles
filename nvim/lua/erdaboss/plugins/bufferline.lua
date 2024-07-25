local M = {
	"akinsho/bufferline.nvim",
	event = "BufRead",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
}

M.config = function()
	require("bufferline").setup {
		options = {
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			diagnostics_indicator = function(count, level, _, _)
				local icon = level == "error" and " "
					or level == "warning" and " "
					or level == "info" and " "
					or "󰌵 "
				return " " .. icon .. count
			end,
		},
	}
end

return M
