local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

local Snacks = require "snacks"

Snacks.setup {
	animate = { enabled = true },
	bigfile = { enabled = true },
	gh = { enabled = true },
	indent = { enabled = true },

	picker = {
		ui_select = true,
		sources = {
			files = {
				hidden = true,
				ignored = true,
				exclude = {
					"**/.git/*",
					"**/node_modules/*",
					"**/.next",
					"**/.DS_Store",
				},
			},
			grep = {
				hidden = true,
				ignored = true,
				exclude = {
					"**/.git/*",
					"**/node_modules/*",
					"**/.next",
					"**/.DS_Store",
				},
			},
		},
	},
}

map("n", "<leader>ff", function() Snacks.picker.files() end, opts "Find in all files")
map("n", "<leader>fo", function() Snacks.picker.recent() end, opts "Find in old files")
map("n", "<leader>fw", function() Snacks.picker.grep() end, opts "Find by Word")
map("n", "<leader>fc", function() Snacks.picker.git_status() end, opts "Find in git changes")
map("n", "<C-b>", function() Snacks.picker.buffers() end, opts "Find in buffers")
map("n", "<leader>fr", function() Snacks.picker.grep() end, opts "Find resume")

map("n", "<leader>gg", function() Snacks.lazygit() end, opts "Open lazygit")

map("n", "<leader>gp", function() Snacks.picker.gh_pr() end, opts "GitHub Pull Requests (open)")
map("n", "<leader>gP", function() Snacks.picker.gh_pr { state = "all" } end, opts "GitHub Pull Requests (all)")
map(
	"n",
	"<leader>gm",
	function() Snacks.picker.gh_pr { state = "all", author = "@me" } end,
	opts "GitHub Pull Requests (mine)"
)

-- Oil LSP base file rename support
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions[1].type == "move" then
			Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
		end
	end,
})
