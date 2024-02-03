local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AndreM222/copilot-lualine",
		"arkav/lualine-lsp-progress",
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
					"buffers",
					show_filename_only = true, -- Shows shortened relative path when set to false.
					hide_filename_extension = false, -- Hide filename extension when set to true.
					show_modified_status = true, -- Shows indicator when the buffer is modified.

					mode = 0, -- 0: Shows buffer name
					-- 1: Shows buffer index
					-- 2: Shows buffer name + buffer index
					-- 3: Shows buffer number
					-- 4: Shows buffer name + buffer number

					filetype_names = {
						TelescopePrompt = "Telescope",
						dashboard = "Dashboard",
						packer = "Packer",
						fzf = "FZF",
						alpha = "Alpha",
					},

					symbols = {
						modified = " 󰏫", -- Text to show when the buffer is modified
						alternate_file = "", -- Text to show to identify the alternate file
						directory = "", -- Text to show when the buffer is a directory
					},
				},
			},
			lualine_x = {
				{
					"lsp_progress",
					display_components = { "lsp_client_name", { "title", "percentage", "message" } },
					timer = { progress_enddelay = 2000, spinner = 0, lsp_client_name_enddelay = 2000 },
				},
			},
			lualine_y = {
				"copilot",
				{
					"filetype",
					colored = true,
					icon_only = false,
				},
			},
			lualine_z = {
				"location",
				"progress",
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "buffers" },
			lualine_x = {},
			lualine_y = { "filetype" },
			lualine_z = { "location", "progress" },
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {
			"neo-tree",
			"quickfix",
		},
	}
end

return M
