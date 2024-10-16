-- GLOBAL OPTIONS
vim.g.copilot_filetypes = { VimspectorPrompt = false }
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.fileformats = "unix,dos"
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.textwidth = 120
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.opt.swapfile = false
vim.opt.iskeyword:append "-"
vim.opt.shortmess:append "sI"

for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵 ", texthl = "DiagnosticSignHint" })

-- GLOBAL KEYMAPS
-- stylua: ignore start
vim.api.nvim_set_keymap("n", "<C-s>", "<CMD>w!<CR>", { desc = "Save current buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC><CMD>w!<CR>", { desc = "Save current buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<C-s>", "<ESC><CMD>w!<CR>", { desc = "Save current buffer", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<C-q>", "<CMD>qa!<CR>", { desc = "Quit all", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "<C-q>", "<ESC><CMD>qa!<CR>", { desc = "Quit all", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<C-q>", "<ESC><CMD>qa!<CR>", { desc = "Quit all", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<leader>q", "<CMD>copen<CR>", { desc = "Open quickfix list", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "[q", "<CMD>cprev<CR>", { desc = "Prev quickfix item", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "]q", "<CMD>cnext<CR>", { desc = "Next quickfix item", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<TAB>", "<CMD>bnext<CR>", { desc = "Next buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", "<CMD>bprev<CR>", { desc = "Previous buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<C-w>b", "<CMD>bd<CR>", { desc = "Close buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<C-z>", "<CMD>bd<CR>", { desc = "Close buffer", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { desc = "Exit from insert mode", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "kj", "<ESC>", { desc = "Exit from insert mode", noremap = true, silent = true, nowait = true })

-- Better window movement
vim.api.nvim_set_keymap("n", "<C-Up>", "<C-w>k", { desc = "Move to the window above", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<C-Down>", "<C-w>j", { desc = "Move to the window below", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>l", { desc = "Move to the window to the right", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<C-Left>", "<C-w>h", { desc = "Move to the window to the left", noremap = true, silent = true, nowait = true })

-- Remove Shift+Arrow keys jumps
vim.api.nvim_set_keymap("n", "<S-Up>", "<Up>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<S-Down>", "<Down>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "<S-Up>", "<Up>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("i", "<S-Down>", "<Down>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<S-Up>", "<Up>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<S-Down>", "<Down>", { noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<C-c>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlight", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { desc = "Keep next search term centered", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { desc = "Keep previous search term centered", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "<C-y>", "ggVG", { desc = "Select all", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "yw", "yiw", { desc = "Yank current word", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "dw", "diw", { desc = "Delete current word", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "cw", "ciw", { desc = "Change current word", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "vw", "viw", { desc = "Select current word", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "x", '"_x', { desc = "Delete character without saving into register", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("n", "J", "mzJ`z", { desc = "Join lines", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { desc = "Indent selection right", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { desc = "Indent selection left", noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", { desc = "Paste without losing current clipboard register", noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("v", "<leader>d", "\"_d", { desc = "Delete without losing current clipboard register", noremap = true, silent = true, nowait = true })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search&replace current word", noremap = true, silent = true, nowait = true })
-- stylua: ignore end

-- GLOBAL AUTOCOMMANDS
vim.api.nvim_create_autocmd(
	{ "TextYankPost" },
	{ callback = function() vim.highlight.on_yank { higroup = "Visual", timeout = 200 } end }
)
vim.api.nvim_create_augroup("MarkdownConceal", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = "MarkdownConceal",
	pattern = "markdown",
	command = "setlocal conceallevel=2",
})
vim.api.nvim_create_augroup("ShellFileFormat", { clear = true })
vim.api.nvim_create_autocmd(
	{ "FileType" },
	{ group = "ShellFileFormat", pattern = "sh", command = "setlocal fileformat=unix" }
)
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "netrw", "Jaq", "qf", "git", "help", "man", "lspinfo", "lir", "tsplayground", "" },
	callback = function() vim.cmd [[ nnoremap <silent> <buffer> q :close<CR> set nobuflisted ]] end,
})

-- GLOBAL FILETYPE DEFINITIONS
vim.filetype.add {
	extension = { mdx = "mdx", env = "sh" },
	filename = { [".env"] = "sh", ["env"] = "sh" },
}

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		-- Preferred color scheme
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup {
				transparent_background = true,
			}
			vim.cmd.colorscheme "catppuccin-mocha"
		end,
	},
	{
		-- Icons
		"nvim-tree/nvim-web-devicons",
		config = function()
			local devicons = require "nvim-web-devicons"
			devicons.set_icon { astro = { icon = "󱓞", color = "#FF7E33", name = "astro" } }
		end,
	},
	{
		-- Pictogram library
		"onsails/lspkind.nvim",
		config = function() require("lspkind").init { symbol_map = { Copilot = "" } } end,
	},
	{
		-- Git tools and signs in the sign column
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("gitsigns").setup {
				on_attach = function(bufnr)
					local gitsigns = require "gitsigns"
                    -- stylua: ignore start
                    vim.keymap.set("n", "[c", "<CMD>Gitsigns prev_hunk<CR>", { desc = "Go previous git change hunk", buffer = bufnr })
                    vim.keymap.set("n", "]c", "<CMD>Gitsigns next_hunk<CR>", { desc = "Go next git change hunk", buffer = bufnr })
                    vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle deleted hunks", buffer = bufnr })
					-- stylua: ignore end
				end,
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "󰍵" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "│" },
				},
				current_line_blame = true,
			}
		end,
	},
	{
		-- Indentation lines
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		main = "ibl",
		opts = {
			indent = { tab_char = "" },
			exclude = {
				filetypes = {
					"lspinfo",
					"checkhealth",
					"help",
					"man",
					"gitcommit",
					"lazy",
					"TelescopePrompt",
					"TelescopeResults",
					"mason",
					"",
				},
			},
			scope = { enabled = false },
		},
		config = function(_, opts) require("ibl").setup(opts) end,
	},
	{
		-- Fuzzy finder
		"nvim-telescope/telescope.nvim",
		lazy = false,
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			local fb_actions = require "telescope._extensions.file_browser.actions"
			require("telescope").setup {
				defaults = {
					vimgrep_arguments = {
						"rg",
						"-L",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
						vertical = { mirror = false },
						width = 0.90,
						height = 0.95,
						preview_cutoff = 120,
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate" },
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" },
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
					mappings = {
						n = {
							["<ESC>"] = require("telescope.actions").close,
							["<C-x>"] = require("telescope.actions").delete_buffer,
						},
						i = {
							["<ESC>"] = require("telescope.actions").close,
							["<C-h>"] = "which_key",
							["<C-x>"] = require("telescope.actions").delete_buffer,
						},
					},
				},
				pickers = {
					find_files = {
						find_command = { "rg", "-L", "--files", "--no-ignore", "--hidden" },
						file_ignore_patterns = { "node_modules", "^.git/", ".next", ".DS_Store" },
					},
					file_browser = { find_command = { "rg", "-L", "--files", "--no-ignore", "--hidden" } },
				},
				extensions_list = { "themes", "terms" },
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown {},
					},
					file_browser = {
						hijack_netw = true,
						hidden = { file_browser = true, folder_browser = true },
						display_stat = { date = true, size = false, mode = false },
						hide_parent_dir = false,
						respect_gitignore = false,
						mappings = {
							["i"] = {
								["<A-c>"] = fb_actions.create,
								["<S-CR>"] = false,
								["<A-r>"] = fb_actions.rename,
								["<A-m>"] = fb_actions.move,
								["<A-y>"] = fb_actions.copy,
								["<A-d>"] = fb_actions.remove,
								["<C-o>"] = false,
								["<C-g>"] = fb_actions.goto_parent_dir,
								["<C-e>"] = false,
								["<C-w>"] = fb_actions.goto_cwd,
								["<C-t>"] = false,
								["<C-f>"] = false,
								["<C-h>"] = false,
								["<C-s>"] = false,
								["<bs>"] = fb_actions.backspace,
							},
							["n"] = {
								["c"] = fb_actions.create,
								["r"] = fb_actions.rename,
								["m"] = fb_actions.move,
								["y"] = fb_actions.copy,
								["d"] = fb_actions.remove,
								["o"] = false,
								["g"] = fb_actions.goto_parent_dir,
								["e"] = false,
								["w"] = fb_actions.goto_cwd,
								["t"] = false,
								["f"] = false,
								["h"] = false,
								["s"] = false,
							},
						},
					},
				},
			}
			require("telescope").load_extension "ui-select"
			require("telescope").load_extension "file_browser"
            -- stylua: ignore start
            vim.api.nvim_set_keymap( "n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find Files", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap( "n", "<leader>fw", "<CMD>Telescope live_grep<CR>", { desc = "Find Word", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap( "n", "<leader>fc", "<CMD>Telescope git_status<CR>", { desc = "Find git Changes", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap( "n", "<C-b>", "<CMD>Telescope buffers sort_mru=true sort_lastused=true<CR>", { desc = "Find Buffers", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap( "n", "<leader>fr", "<CMD>Telescope resume<CR>", { desc = "Find Resume", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap( "n", "<leader>fe", "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR><CR>", { desc = "File Explorer", noremap = true, silent = true, nowait = true })
			-- stylua: ignore end
			vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#f2cdcd", bg = "#313244" })
		end,
	},
	{
		-- Bottom Status line
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				vim.o.statusline = " "
			else
				vim.o.laststatus = 0
			end
		end,
		config = function()
			require("lualine").setup {
				options = { theme = "catppuccin", globalstatus = true },
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						{ "diff", colored = true, symbols = { added = " ", modified = " ", removed = " " } },
						{ "diagnostics", sections = { "error", "warn" }, colored = true },
					},
					lualine_c = {
						{
							"filename",
							file_status = true,
							newfile_status = true,
							path = 1,
							shorting_target = 60,
							symbols = { modified = "󰏫 ", readonly = " ", unnamed = "", newfile = "✚ " },
						},
					},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location", "progress" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = { "filetype" },
					lualine_z = { "location", "progress" },
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = { "quickfix" },
			}
		end,
	},
	{
		-- Nicer UI and better notifications
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		config = function()
			require("notify").setup { background_colour = "#000000", render = "wrapped-compact", max_width = 50 }
			require("noice").setup {
				views = { mini = { win_options = { winblend = 0 } } },
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			}
		end,
	},
	{
		-- Undo tree
		"jiaoshijie/undotree",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufReadPre",
		config = function()
			require("undotree").setup {
				float_diff = true,
				layout = "left_bottom",
				position = "left",
				ignore_filetype = {
					"undotree",
					"undotreeDiff",
					"qf",
					"TelescopePrompt",
					"spectre_panel",
					"tsplayground",
				},
				window = { winblend = 0 },
				keymaps = {
					["<Down>"] = "move_next",
					["<Up>"] = "move_prev",
					["gj"] = "move2parent",
					["J"] = "move_change_next",
					["K"] = "move_change_prev",
					["<cr>"] = "action_enter",
					["p"] = "enter_diffbuf",
					["q"] = "quit",
				},
			}
            -- stylua: ignore start
            vim.api.nvim_set_keymap( "n", "<leader>tu", "<CMD>lua require('undotree').toggle()<CR>", { desc = "Toggle undo tree", noremap = true, silent = true, nowait = true })
			-- stylua: ignore end
		end,
	},
	{
		-- Bufferline Status line
		"akinsho/bufferline.nvim",
		event = "BufRead",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup {
				options = {
					diagnostics = "nvim_lsp",
					always_show_bufferline = true,
					diagnostics_indicator = function(count, level, _, _)
						local icon = level == "error" and " "
							or level == "warning" and " "
							or level == "info" and " "
							or "󰌵 "
						return " " .. icon .. count
					end,
				},
			}
		end,
	},
	{
		-- Syntax highlighting and parsing
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.install").compilers = { "clang", "gcc" }
			local config = require "nvim-treesitter.configs"
			vim.treesitter.language.register("markdown", "mdx")
			config.setup {
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"c",
					"cpp",
					"lua",
					"bash",
					"javascript",
					"typescript",
					"json",
					"jsonc",
					"yaml",
					"c_sharp",
					"html",
					"css",
					"astro",
					"tsx",
					"python",
					"go",
					"gomod",
					"markdown",
					"markdown_inline",
					"toml",
					"csv",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-Space>",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
					},
				},
			}
		end,
	},
	{
		-- LSP
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconf = require "lspconfig"
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			local on_attach = function(_, bufnr)
                -- stylua: ignore start
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation", buffer = bufnr })
                vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "Go to Definition", buffer = bufnr })
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Go to References", buffer = bufnr })
                vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, { desc = "Go to Implementations", buffer = bufnr })
                vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions, { desc = "Go to Type definitions", buffer = bufnr })
                vim.keymap.set("n", "ge", function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "Go to Errors", buffer = bufnr })
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", buffer = bufnr })
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", buffer = bufnr })
                vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr })
				-- stylua: ignore end
			end
			-- Lua LSP
			lspconf.lua_ls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			}

			local mason_registry = require "mason-registry"
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			-- TypeScript, JavaScript, JSX and TSX LSP
			lspconf.ts_ls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server_path,
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			}

			-- CSS LSP
			lspconf.cssls.setup {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					css = { validate = true, lint = { unknownAtRules = "ignore" } },
					scss = { validate = true, lint = { unknownAtRules = "ignore" } },
					less = { validate = true, lint = { unknownAtRules = "ignore" } },
				},
			}

			-- Python LSP
			lspconf.pyright.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "python" },
			}

			-- Go LSP
			lspconf.gopls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = { ununsedparams = true, staticcheck = true },
					},
				},
			}

			local default_servers = {
				"volar", -- Vue LSP
				"eslint", -- ESLint LSP
				"jsonls", -- JSON LSP
				"yamlls", -- YAML LSP
				"taplo", -- TOML LSP
				"bashls", -- Bash (Shell) LSP
				"csharp_ls", -- C# LSP
				"astro", -- Astro LSP
				"html", -- HTML LSP
				"tailwindcss", -- TailwindCSS LSP
				"marksman", -- Markdown and MDX LSP
				"prismals", -- Prisma ORM LSP
			}
			for _, server in pairs(default_servers) do
				require("lspconfig")[server].setup { on_attach = on_attach, capabilities = capabilities }
			end
		end,
	},
	{
		-- Mason Dependency Manager
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		config = function() require("mason").setup() end,
	},
	{
		-- Automation for Mason Dependency Manager
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup {
				ensure_installed = {
					"lua-language-server", -- Lua LSP
					"bash-language-server", -- Bash LSP
					"typescript-language-server", -- TypeScript, JavaScript, JSX and TSX LSP
					"astro-language-server", -- Astro LSP
					"emmet-ls", -- Emmet LSP
					"css-lsp", -- CSS LSP
					"html-lsp", -- HTML LSP
					"eslint-lsp", -- ESLint LSP - Linter for JavaScript and TypeScript
					"tailwindcss-language-server", -- TailwindCSS LSP
					"prisma-language-server", -- Prisma ORM LSP
					"json-lsp", -- JSON LSP
					"yaml-language-server", -- YAML LSP
					"marksman", -- Markdown and MDX LSP
					"pyright", -- Python LSP
					{ "csharp-language-server", version = "0.10.0" }, -- C# LSP
					"gopls", -- Go LSP
					"taplo", -- TOML LSP
					"vue-language-server", -- Vue LSP"
					"stylua", -- Lua formatter
					"shfmt", -- Bash formatter
					"prettierd", -- Formatter for Astro, HTML, CSS, Markdown, MDX, JavaScript, TypeScript, JSX, TSX, JSON
					"black", -- Python formatter
					"csharpier", -- C# formatter
					"gofumpt", -- Go formatter
					"goimports-reviser", -- Go imports formatter
					"golines", -- Go lines formatter
				},
			}
		end,
	},
	{
		-- LSP Wrapper for Formatters and Linters
		"nvimtools/none-ls.nvim",
		event = "BufEnter",
		config = function()
			local null_ls = require "null-ls"
			local lsp_formatting = function(bufnr)
				vim.lsp.buf.format {
					timeout_ms = 5000,
					filter = function(client) return client.name == "null-ls" end,
					bufnr = bufnr,
				}
			end
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup {
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd.with {
						extra_filetypes = { "astro", "prisma" },
						disabled_filetypes = { "markdown" },
						extra_args = { "--ignore-path", "./.prettierignore" },
					},
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.csharpier,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.goimports_reviser,
					null_ls.builtins.formatting.golines,
				},
				on_attach = function(client, bufnr)
					if client.supports_method "textDocument/formatting" then
						vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
						vim.api.nvim_create_autocmd(
							"BufWritePre",
							{ group = augroup, buffer = bufnr, callback = function() lsp_formatting(bufnr) end }
						)
					end
				end,
			}
		end,
	},
	{
		-- Autocompletion
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
			"onsails/lspkind.nvim", -- Pictogram library
		},
		config = function()
			require("copilot_cmp").setup()
			local cmp = require "cmp"
			local luasnip = require "luasnip"
			local lspkind = require "lspkind"

			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
			})

			cmp.setup {
				preselect = "none",
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
				formatting = { format = lspkind.cmp_format { maxwidth = 50, ellipsis_char = "..." } },
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
	},
	{
		-- Github Copilot
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup {
				suggestion = { enable = false },
				panel = { enable = false },
			}
		end,
	},
	{
		-- QOL for commenting
		"echasnovski/mini.comment",
		version = "*",
		event = "BufRead",
		config = function()
			require("mini.comment").setup {
				mappings = { comment = "", comment_line = "<C-_>", comment_visual = "<C-_>" },
			}
		end,
	},
	{
		-- QOL for surrounding text
		"echasnovski/mini.surround",
		version = "*",
		event = "BufRead",
		config = function() require("mini.surround").setup() end,
	},
	{
		-- Symbols outline
		"Wansmer/symbol-usage.nvim",
		event = "BufReadPre",
		config = function() require("symbol-usage").setup() end,
	},
	{
		-- Golang tools
		"olexsmir/gopher.nvim",
		enabled = true,
		ft = "go",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("gopher").setup {
				commands = {
					go = "go",
					gomodifytags = "gomodifytags",
					gotests = "~/go/bin/gotests",
					impl = "impl",
					iferr = "iferr",
				},
			}
            -- stylua: ignore
            vim.api.nvim_set_keymap( "n", "<leader>jg", "<CMD>GoTagAdd json<CR>", { desc = "Add Go Struct JSON Tags", noremap = true, silent = true, nowait = true })
		end,
		build = function() vim.cmd [[silent! GoInstallDeps]] end,
	},
	{
		-- Debugging tools
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
			{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
			"theHamsta/nvim-dap-virtual-text",
			{
				"microsoft/vscode-js-debug",
				build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
				version = "1.*",
			},
		},
		event = "BufRead",
		config = function()
			require("dapui").setup()
			require("dap-go").setup()
			require("nvim-dap-virtual-text").setup {}
			local dap, dapui = require "dap", require "dapui"
			require("dap-vscode-js").setup {
				debugger_path = vim.fn.resolve(vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"),
				adapters = { "pwa-node" },
			}
			for _, language in ipairs { "typescript", "javascript" } do
				require("dap").configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "npm run test:debug (console)",
						runtimeExecutable = "npm",
						runtimeArgs = { "run", "test:debug" },
						rootPath = "${workspaceFolder}",
						cwd = "${workspaceFolder}",
						console = "integratedTerminal",
						internalConsoleOptions = "neverOpen",
					},
				}
			end
			dap.listeners.before.attach.dapui_config = function() dapui.open() end
			dap.listeners.before.launch.dapui_config = function() dapui.open() end
			dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
			dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
			vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#d20f39" })
			vim.api.nvim_set_hl(0, "DapStopped", { fg = "#fab387" })
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })
            -- stylua: ignore start
            vim.api.nvim_set_keymap("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", { desc = "Debug Breakpoint", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap("n", "<leader>dc", "<CMD>DapContinue<CR>", { desc = "Debug Continue", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap("n", "<leader>dt", "<CMD>DapTerminate<CR>", { desc = "Debug Terminate", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap("n", "<leader>ds", "<CMD>DapStepOver<CR>", { desc = "Debug Step over", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap("n", "<leader>dh", "<CMD>:lua require('dap.ui.widgets').hover()<CR>", { desc = "Debug Hover", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap("n", "<leader>dp", "<CMD>:lua require('dap.ui.widgets').preview()<CR>", { desc = "Debug Preview", noremap = true, silent = true, nowait = true })
			-- stylua: ignore end
		end,
	},
	{
		-- Cloak for hiding sensitive information
		"laytan/cloak.nvim",
		lazy = false,
		config = function()
			require("cloak").setup { enabled = true, patterns = { { file_pattern = "*.env", cloak_pattern = "=.+" } } }
            -- stylua: ignore start
            vim.api.nvim_set_keymap( "n", "<leader>tc", "<CMD>CloakToggle<CR>", { desc = "Toggle cloak", noremap = true, silent = true, nowait = true })
			-- stylua: ignore end
		end,
	},
	{
		-- Obsidian integration for note taking
		"epwalsh/obsidian.nvim",
		enabled = true,
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
            -- stylua: ignore start
            vim.api.nvim_set_keymap( "n", "<leader>fd", ":ObsidianDailies<CR>", { desc = "Find Daily Note", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap( "n", "<leader>fn", ":ObsidianSearch<CR>", { desc = "Find Note", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap( "n", "<leader>ft", ":ObsidianTags<CR>", { desc = "Find Note Tag", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap( "n", "<leader>nn", ":ObsidianNew ", { desc = "New  Note", noremap = true, silent = true, nowait = true })
            vim.api.nvim_set_keymap( "n", "<leader>nt", ":ObsidianTemplate<CR>", { desc = "Note  Template", noremap = true, silent = true, nowait = true })
			-- stylua: ignore end
		end,
	},
	{
		-- LazyGit git client
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
            -- stylua: ignore
            vim.api.nvim_set_keymap( "n", "<leader>g", "<CMD>LazyGit<CR>", { desc = "Open LazyGit", noremap = true, silent = true, nowait = true })
		end,
	},
	{
		-- QOL for keybindings
		"folke/which-key.nvim",
		event = "VeryLazy",
		cmd = "WhichKey",
		opts = {},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
}, {
	install = { colorscheme = { "catppuccin", "default" } },
	defaults = { lazy = true },
	ui = { border = "rounded", icons = { ft = "", lazy = "󰂠 ", loaded = "", not_loaded = "" } },
	change_detection = { enabled = true, notify = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
})
