vim.g.lualine_laststatus = vim.o.laststatus
if vim.fn.argc(-1) > 0 then
	vim.o.statusline = " "
else
	vim.o.laststatus = 0
end

require("lualine").setup {
	options = { theme = "catppuccin", globalstatus = true },
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{ "diff", colored = true, symbols = { added = " ", modified = " ", removed = " " } },
			{ "diagnostics", sections = { "error", "warn" }, colored = true },
		},
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 1,
				shorting_target = 60,
				symbols = { modified = "󰏫 ", readonly = " ", unnamed = "", newfile = "✚ " },
			},
		},
		lualine_x = {},
		lualine_y = { "lsp_status" },
		lualine_z = { "location", "progress" },
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
	extensions = { "quickfix" },
}

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

require("notify").setup {
	merge_duplicates = false,
	background_colour = "#000000",
	render = "wrapped-compact",
	max_width = 50,
}

require("noice").setup {
	views = { mini = { win_options = { winblend = 0 } } },
	cmdline = {
		view = "cmdline", -- cmdline | cmdline_popup
	},
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
}
