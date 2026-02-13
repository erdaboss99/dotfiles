-- Lazy load on first insert mode entry
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = group,
	once = true,
	callback = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }

		require("blink.cmp").setup {
			keymap = {
				preset = "none",
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<C-Space>"] = { "show", "hide", "fallback" },
				["<CR>"] = { "select_and_accept", "fallback" },
				["<C-d>"] = { "hide_documentation", "show_documentation", "fallback" },
				["<Up>"] = { "scroll_documentation_up", "fallback" },
				["<Down>"] = { "scroll_documentation_down", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
					},
					border = "rounded",
					winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
					scrollbar = false,
				},
				documentation = {
					auto_show = true,
					window = {
						border = "rounded",
						winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
					},
				},
			},
			sources = {
				default = { "copilot", "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 110,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		}
	end,
})
