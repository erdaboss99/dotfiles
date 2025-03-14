local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

return {
	-- Obsidian integration for note taking
	"epwalsh/obsidian.nvim",
	enabled = vim.env.OBSIDIAN_PATH ~= nil,
	version = "*",
	event = "VeryLazy",
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("obsidian").setup {
			ui = { enable = true },
			workspaces = { { name = "Vault", path = "$OBSIDIAN_PATH", overrides = { notes_subdir = "Notes" } } },
			new_notes_location = "notes_subdir",
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
			templates = { subdir = "templates", date_format = "%Y-%m-%d", time_format = "%H:%M:%S" },
			daily_notes = {
				folder = "Dailies",
				date_format = "%Y-%m-%d",
				default_tags = { "daily-notes" },
				template = "dailies",
			},
			completion = { nvim_cmp = true, min_chars = 2 },
		}
		map("n", "<leader>fn", "<CMD>ObsidianSearch<CR>", opts "Find in notes")
		map("n", "<leader>ft", "<CMD>ObsidianTags<CR>", opts "Find by note tag")
		map("n", "<leader>nn", "<CMD>ObsidianNew<CR>", opts "New note")
		map("n", "<leader>nt", "ggVGd<CMD>ObsidianTemplate<CR>", opts "Insert not template")
	end,
}
