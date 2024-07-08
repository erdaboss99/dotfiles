local M = {
	"epwalsh/obsidian.nvim",
	enabled = false,
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

		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
	}

    -- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<leader>nn", ":ObsidianNew ", { desc = "New  Note", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>nt", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>", { desc = "Note  Template", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fn", ":ObsidianSearch<CR>", { desc = "Find Note", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>nf", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>", { desc = "Note Title Format", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
