return {
	{
		-- Preffered Color Scheme
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup {
				transparent_background = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					telescope = true,
					treesitter = true,
				},
			}
			vim.cmd.colorscheme "catppuccin-mocha"
		end,
	},
	{
		-- Icons
		"nvim-tree/nvim-web-devicons",
		config = function()
			local devicons = require "nvim-web-devicons"
			devicons.set_icon { astro = { icon = "󱓞", color = "#FF7E33", name = "astro" } }
		end,
	},
	{
		-- Indentation lines
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		main = "ibl",
		config = function()
			require("ibl").setup {
				indent = { tab_char = "➜" },
				exclude = {
					filetypes = {
						"lspinfo",
						"checkhealth",
						"help",
						"man",
						"gitcommit",
						"lazy",
						"TelescopePrompt",
						"TelescopeResults",
						"mason",
						"",
					},
				},
				scope = { enabled = false },
			}
		end,
	},
	{
		-- Bottom Status line
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				vim.o.statusline = " "
			else
				vim.o.laststatus = 0
			end
		end,
		config = function()
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
		end,
	},
	{
		-- Bufferline Status line
		"akinsho/bufferline.nvim",
		event = "BufRead",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
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
		end,
	},
	{
		-- Nicer UI and better notifications
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		config = function()
			require("notify").setup {
				merge_duplicates = false,
				background_colour = "#000000",
				render = "wrapped-compact",
				max_width = 50,
			}
			require("noice").setup {
				views = { mini = { win_options = { winblend = 0 } } },
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
		end,
	},
}
