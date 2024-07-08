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
		-- set an empty statusline till lualine loads
		vim.o.statusline = " "
	else
		-- hide the statusline on the starter page
		vim.o.laststatus = 0
	end
end

M.config = function()
	require("lualine").setup {
		options = {
			icons_enabled = true,
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
					colored = true, -- Displays diagnostics status in color if set to true.
				},
			},
			lualine_c = {
				{
					"filename",
					file_status = true, -- Displays file status (readonly status, modified status)
					newfile_status = true, -- Display new file status (new file means no write after created)
					path = 1, -- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory

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
			-- "neo-tree",
			"quickfix",
		},
	}
end

return M
