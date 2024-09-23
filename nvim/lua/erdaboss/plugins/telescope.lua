local M = {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
}

M.config = function()
	local fb_actions = require "telescope._extensions.file_browser.actions"
	require("telescope").setup {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"-L",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob",
				"!**/.git/*",
			},
			prompt_prefix = "   ",
			selection_caret = "  ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				vertical = {
					mirror = false,
				},
				width = 0.90,
				height = 0.95,
				preview_cutoff = 120,
			},
			file_sorter = require("telescope.sorters").get_fuzzy_file,
			file_ignore_patterns = {
				"node_modules",
				"/.git/",
				".next",
				".DS_Store",
			},
			generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
			path_display = {
				"truncate",
			},
			winblend = 0,
			border = {},
			borderchars = {
				"─",
				"│",
				"─",
				"│",
				"╭",
				"╮",
				"╯",
				"╰",
			},
			color_devicons = true,
			set_env = {
				["COLORTERM"] = "truecolor",
			},
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
			buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			mappings = {
				n = {
					["<ESC>"] = require("telescope.actions").close,
					["<C-x>"] = require("telescope.actions").delete_buffer,
				},
				i = {
					["<ESC>"] = require("telescope.actions").close,
					["<C-h>"] = "which_key",
					["<C-x>"] = require("telescope.actions").delete_buffer,
				},
			},
		},
		pickers = {
			find_files = {
				find_command = { "rg", "-L", "--files", "--no-ignore", "--hidden", "--glob", "!**/.git/*" },
			},
		},
		extensions_list = {
			"themes",
			"terms",
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown {},
			},
			file_browser = {
				hijack_netw = true,
				hidden = { file_browser = true, folder_browser = true },
				display_stat = { date = true, size = false, mode = false },
				hide_parent_dir = false,
				respect_gitignore = false,
				mappings = {
					["i"] = {
						["<A-c>"] = fb_actions.create,
						["<S-CR>"] = false,
						["<A-r>"] = fb_actions.rename,
						["<A-m>"] = fb_actions.move,
						["<A-y>"] = fb_actions.copy,
						["<A-d>"] = fb_actions.remove,
						["<C-o>"] = false,
						["<C-g>"] = false,
						["<C-e>"] = false,
						["<C-w>"] = false,
						["<C-t>"] = false,
						["<C-f>"] = false,
						["<C-h>"] = false,
						["<C-s>"] = false,
						["<bs>"] = fb_actions.backspace,
					},
					["n"] = {
						["c"] = fb_actions.create,
						["r"] = fb_actions.rename,
						["m"] = fb_actions.move,
						["y"] = fb_actions.copy,
						["d"] = fb_actions.remove,
						["o"] = false,
						["g"] = false,
						["e"] = false,
						["w"] = false,
						["t"] = false,
						["f"] = false,
						["h"] = false,
						["s"] = false,
					},
				},
			},
		},
	}

	require("telescope").load_extension "ui-select"
	require("telescope").load_extension "file_browser"

    -- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find Files", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fw", "<CMD>Telescope live_grep<CR>", { desc = "Find Word", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fc", "<CMD>Telescope git_status<CR>", { desc = "Find git Changes", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<C-b>", "<CMD>Telescope buffers sort_mru=true sort_lastused=true<CR>", { desc = "Find Buffers", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fr", "<CMD>Telescope resume<CR>", { desc = "Find Resume", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fe", "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR><CR>", { desc = "File Explorer", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
