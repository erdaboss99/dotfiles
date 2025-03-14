return {
	-- Auto completion plugin
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"zbirenbaum/copilot-cmp", -- Source for Copilot
		"hrsh7th/cmp-buffer", -- Source for text in buffer
		"hrsh7th/cmp-path", -- Source for file paths
		"hrsh7th/cmp-nvim-lsp", -- Source for lsp
		"hrsh7th/cmp-cmdline", -- Source for cmdline
		"hrsh7th/cmp-nvim-lua", -- Source for nvim lua
		"L3MON4D3/LuaSnip", -- Snippet engine
		"saadparwaiz1/cmp_luasnip", -- for Lua auto completion
		"rafamadriz/friendly-snippets", -- Snippet library
	},

	config = function()
		require("copilot_cmp").setup()
		local cmp = require "cmp"
		local luasnip = require "luasnip"

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
		})

		cmp.setup {
			preselect = "None",
			completion = { completeopt = "menu,menuone,noselect,noinsert,preview" },
			view = { docs = { auto_open = true } },
			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
					scrollbar = false,
					col_offset = -3,
					scrolloff = 8,
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
				},
			},
			snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
			mapping = {
				["<S-Up>"] = cmp.mapping.select_prev_item(),
				["<S-Down>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-e>"] = cmp.mapping.close(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = false },
				["<C-d>"] = function()
					if cmp.visible_docs() then
						cmp.close_docs()
					else
						cmp.open_docs()
					end
				end,
			},
			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = "[" .. entry.source.name .. "]"
					return vim_item
				end,
				expandable_indicator = true,
				fields = { "abbr", "kind", "menu" },
			},
			sources = {
				{ name = "copilot", group_index = 1 },
				{ name = "nvim_lsp", group_index = 1 },
				{ name = "luasnip", group_index = 1 },
				{ name = "nvim_lua", group_index = 1 },
				{ name = "path", group_index = 1 },
				-- { name = "buffer", group_index = 2 },
			},
		}
	end,
}
