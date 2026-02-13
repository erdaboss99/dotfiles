require("catppuccin").setup {
	transparent_background = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		treesitter = true,
		notify = true,
		noice = true,
		mason = true,
		dap_ui = true,
		snacks = { enabled = true },
		blink_cmp = {
			style = "bordered",
		},
		render_markdown = true,
		which_key = true,
	},
}

vim.cmd.colorscheme "catppuccin-mocha"
