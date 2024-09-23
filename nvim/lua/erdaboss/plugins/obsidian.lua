local M = {
	"epwalsh/obsidian.nvim",
	enabled = true,
	version = "*",
	event = "VeryLazy",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

M.config = function()
	require("obsidian").setup {
		ui = {
			enable = true,
		},
		workspaces = {
			{
				name = "Vault",
				path = "$OBSIDIAN_PATH",
				overrides = {
					notes_subdir = "Notes",
				},
			},
		},
		disable_frontmatter = true,
		mappings = {},
		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.date "%Y-%m-%d") .. "_" .. suffix
		end,

		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M:%S",
		},

		daily_notes = {
			folder = "Dailies",
			date_format = "%Y-%m-%d",
			default_tags = { "daily-notes" },
			template = "dailies",
		},

		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
	}

    -- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<leader>fd", ":ObsidianDailies<CR>", { desc = "Find Daily Note", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fn", ":ObsidianSearch<CR>", { desc = "Find Note", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>ft", ":ObsidianTags<CR>", { desc = "Find Note Tag", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>nn", ":ObsidianNew ", { desc = "New  Note", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>nt", ":ObsidianTemplate note<CR> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>", { desc = "Note  Template", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
