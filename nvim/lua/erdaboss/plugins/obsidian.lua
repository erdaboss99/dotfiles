local M = {
	"epwalsh/obsidian.nvim",
	version = "*",
	event = "VeryLazy",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

local vault_path = function()
	if vim.loop.os_uname().sysname == "Darwin" then
		return "/Users/erdelyiroland/Library/Mobile Documents/iCloud~md~obsidian/Documents/erdelyiroland"
	else
		return "/mnt/c/Users/rerdelyi/iCloudDrive/iCloud~md~obsidian/erdelyiroland"
	end
end

M.config = function()
	require("obsidian").setup {
		ui = {
			enable = false,
		},
		workspaces = {
			{
				name = "Vault",
				path = vault_path(),
				overrides = {
					notes_subdir = "Notes",
				},
			},
		},
		daily_notes = {
			folder = "Dailies",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			template = nil,
		},
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
			return tostring(os.date "%Y-%m-%d-%H-%M-%S") .. "_" .. suffix
		end,

		templates = {
			subdir = "Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
	}

    -- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<leader>nt", "<CMD>ObsidianToday<CR>", { desc = "[N]ote of [T]oday", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>nn", ":ObsidianNew ", { desc = "[N]ew  [N]ote", noremap = true, silent = true, nowait = true })
	vim.api.nvim_set_keymap( "n", "<leader>fn", ":ObsidianSearch<CR>", { desc = "[F]ind [N]ote", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
