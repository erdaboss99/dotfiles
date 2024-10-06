local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

M.init = function()
	vim.g.lualine_laststatus = vim.o.laststatus
	if vim.fn.argc(-1) > 0 then
		vim.o.statusline = " "
	else
		vim.o.laststatus = 0
	end
end

M.config = function()
	require("lualine").setup {
		options = {
			theme = "catppuccin",
			globalstatus = true,
		},
		sections = {
			lualine_a = {
				"mode",
			},
			lualine_b = {
				"branch",
				{
					"diff",
					colored = true,
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
				},
				{
					"diagnostics",
					sections = {
						"error",
						"warn",
					},
					colored = true,
				},
			},
			lualine_c = {
				{
					"filename",
					file_status = true,
					newfile_status = true,
					path = 1,

					shorting_target = 60,
					symbols = {
						modified = "󰏫 ",
						readonly = " ",
						unnamed = "",
						newfile = "✚ ",
					},
				},
			},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				"location",
				"progress",
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = { "filetype" },
			lualine_z = { "location", "progress" },
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {
			"quickfix",
		},
	}
end

return M
