local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

require("oil").setup {
	default_file_explorer = true,
	columns = {
		"icon",
		"size",
		"mtime",
	},
	skip_confirm_for_simple_edits = false,
	prompt_save_on_select_new_entry = true,
	watch_for_changes = true,
	keymaps = {
		["<CR>"] = "actions.select",
		["<C-p>"] = "actions.preview",
		["q"] = { "actions.close", mode = "n" },
		["<esc>"] = { "actions.close", mode = "n" },
		["<C-l>"] = "actions.refresh",
		["-"] = { "actions.parent", mode = "n" },
		["_"] = { "actions.open_cwd", mode = "n" },
		["<Tab>"] = { "actions.open_cwd", mode = "n" },
		["gs"] = false,
		["<C-h>"] = { "actions.show_help", mode = "n" },
		["g?"] = false,
		["<C-v>"] = "actions.select_vsplit",
		["<C-t>"] = false,
		["<C-s>"] = false,
		["<C-c>"] = false,
		["`"] = false,
		["~"] = false,
		["gx"] = false,
		["g."] = false,
		["g\\"] = false,
	},
	view_options = {
		show_hidden = true,
		is_hidden_file = function(name, _)
			local m = name:match "^%."
			return m ~= nil
		end,
		-- is_always_hidden = function(name, _)
		-- 	local node_modules = name:match "node_modules"
		-- 	return node_modules ~= nil
		-- end,
	},
	win_options = {
		signcolumn = "yes:2",
	},
}

require("oil-git-status").setup()

map("n", "-", "<CMD>Oil --float<CR>", opts "Open parent directory")
