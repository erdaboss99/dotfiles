local M = {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
}

M.config = function()
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
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			file_sorter = require("telescope.sorters").get_fuzzy_file,
			file_ignore_patterns = {
				"node_modules",
				".git/",
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
					["<C-d>"] = require("telescope.actions").delete_buffer,
				},
				i = {
					["<ESC>"] = require("telescope.actions").close,
					["<C-h>"] = "which_key",
					["<C-d>"] = require("telescope.actions").delete_buffer,
				},
			},
		},
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--no-ignore", "--hidden", "--glob", "!**/.git/*" },
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
		},
	}
	require("telescope").load_extension "ui-select"

    -- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find Files", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fw", "<CMD>Telescope live_grep<CR>", { desc = "Find Word", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fg", "<CMD>Telescope git_files<CR>", { desc = "Find Git files", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fc", "<CMD>Telescope git_status<CR>", { desc = "Find git Changes", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fk", "<CMD>Telescope keymaps<CR>", { desc = "Find Keymaps", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Find Help page", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fb", "<CMD>Telescope buffers sort_mru=true sort_lastused=true<CR>", { desc = "Find Buffers", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>b", "<CMD>Telescope buffers sort_mru=true sort_lastused=true<CR>", { desc = "Find Buffers", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fd", "<CMD>Telescope diagnostics<CR>", { desc = "Find Diagnostics", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>ft", "<CMD>Telescope treesitter<CR>", { desc = "Find Tokens", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fr", "<CMD>Telescope resume<CR>", { desc = "Find Resume", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
