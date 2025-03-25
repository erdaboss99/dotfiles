local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

return {
	-- Fuzzy Finder
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
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
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
					vertical = { mirror = false },
					width = 0.90,
					height = 0.95,
					preview_cutoff = 120,
				},
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" },
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
					find_command = { "rg", "-L", "--files", "--no-ignore", "--hidden" },
					file_ignore_patterns = { "node_modules", "^.git/", ".next", ".DS_Store" },
				},
			},
			extensions_list = { "themes", "terms" },
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
		map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts "[F]ind in all [F]iles")
		map("n", "<leader>fo", "<CMD>Telescope oldfiles<CR>", opts "[F]ind in [O]ld files")
		map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>", opts "[F]ind by [W]ord")
		map("n", "<leader>fc", "<CMD>Telescope git_status<CR>", opts "[F]ind in git [C]hanges")
		map("n", "<leader>fs", "<CMD>Telescope spell_suggest<CR>", opts "[F]ind spell [S]uggestion")
		map("n", "<C-b>", "<CMD>Telescope buffers sort_mru=true sort_lastused=true<CR>", opts "Find in buffers")
		map("n", "<leader>fr", "<CMD>Telescope resume<CR>", opts "[F]ind [R]esume")
		vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#f2cdcd", bg = "#313244" })
	end,
}
