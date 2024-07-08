local M = {
	"nvim-telescope/telescope-file-browser.nvim",
	version = "*",
	lazy = false,
}

M.config = function()
	local fb_actions = require "telescope._extensions.file_browser.actions"
	require("telescope").setup {
		extensions = {
			file_browser = {
				hijack_netw = true,
				mappings = {
					["i"] = {
						["<A-c>"] = fb_actions.create,
						["<S-CR>"] = false,
						["<A-r>"] = fb_actions.rename,
						["<A-m>"] = fb_actions.move,
						["<A-y>"] = fb_actions.copy,
						["<A-d>"] = fb_actions.remove,
						["<C-o>"] = fb_actions.open,
						["<C-g>"] = fb_actions.goto_parent_dir,
						["<C-e>"] = fb_actions.goto_home_dir,
						["<C-w>"] = fb_actions.goto_cwd,
						["<C-t>"] = fb_actions.change_cwd,
						["<C-f>"] = fb_actions.toggle_browser,
						["<C-h>"] = fb_actions.toggle_hidden,
						["<C-s>"] = fb_actions.toggle_all,
						["<bs>"] = fb_actions.backspace,
					},
					["n"] = {
						["c"] = fb_actions.create,
						["r"] = fb_actions.rename,
						["m"] = fb_actions.move,
						["y"] = fb_actions.copy,
						["d"] = fb_actions.remove,
						["o"] = fb_actions.open,
						["g"] = fb_actions.goto_parent_dir,
						["e"] = false,
						["w"] = fb_actions.goto_cwd,
						["t"] = fb_actions.change_cwd,
						["f"] = fb_actions.toggle_browser,
						["h"] = fb_actions.toggle_hidden,
						["s"] = fb_actions.toggle_all,
					},
				},
			},
		},
	}
	require("telescope").load_extension "file_browser"
	-- stylua: ignore start
	vim.api.nvim_set_keymap( "n", "<leader>fe", "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR><CR>", { desc = "File Explorer", noremap = true, silent = true, nowait = true })
	-- stylua: ignore end
end

return M
