local M = {
	"nvim-neo-tree/neo-tree.nvim",
	event = "VeryLazy",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}

M.config = function()
	require("neo-tree").setup {
		sources = {
			"filesystem",
			"git_status",
		},
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		source_selector = {
			statusline = true, -- Toggle to show selector on statusline
			winbar = true,
			sources = {
				{
					source = "filesystem",
				},
				{
					source = "git_status",
				},
			},
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute {
						action = "close",
					}
				end,
			},
		},
		default_component_configs = {
			git_status = {
				symbols = {
					added = "✚",
					modified = "󰏫",
					deleted = "✖",
					renamed = "󰁕",
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},
		},
		window = {
			mappings = {
				["s"] = "open_split",
				["v"] = "open_vsplit",
				["c"] = "",
				["m"] = "",
			},
		},
		filesystem = {
			window = {
				mappings = {
					["<bs>"] = "",
					["."] = "",
					["#"] = "",
					["D"] = "",
					["f"] = "",
					["<c-x>"] = "",
					["o"] = "",
					["oc"] = "",
					["od"] = "",
					["og"] = "",
					["om"] = "",
					["on"] = "",
					["os"] = "",
					["ot"] = "",
				},
			},
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				never_show = {
					".DS_Store",
					"thumbs.db",
					"node_modules",
					".git",
					".obsidian",
				},
			},
		},
		git_status = {
			window = {
				mappings = {
					["A"] = "",
					["gu"] = "",
					["ga"] = "",
					["gr"] = "",
					["gc"] = "",
					["gp"] = "",
					["gg"] = "",
					["o"] = "",
					["oc"] = "",
					["od"] = "",
					["om"] = "",
					["on"] = "",
					["os"] = "",
					["ot"] = "",
				},
			},
		},
	}

	-- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<Char-0xAB>", "<CMD>Neotree toggle<CR>", { desc = "Toggle File Explorer", noremap = true, silent = true, nowait = true }) -- <CMD-b>
	vim.api.nvim_set_keymap( "i", "<Char-0xAB>", "<ESC><CMD>Neotree toggle<CR>", { desc = "Toggle File Explorer", noremap = true, silent = true, nowait = true }) -- <CMD-b>
	vim.api.nvim_set_keymap( "n", "<C-b>", "<CMD>Neotree toggle<CR>", { desc = "Toggle File Explorer", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "i", "<C-b>", "<ESC><CMD>Neotree toggle<CR>", { desc = "Toggle File Explorer", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
