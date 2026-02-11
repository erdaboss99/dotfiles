local map = vim.keymap.set
local opts = function(desc) return { desc = desc, noremap = true, silent = true, nowait = true } end

if vim.env.OBSIDIAN_PATH ~= nil then
	require("obsidian").setup {
		ui = { enable = false },
		workspaces = { { name = "Vault", path = "$OBSIDIAN_PATH", overrides = { notes_subdir = "Notes" } } },
		new_notes_location = "notes_subdir",
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
		legacy_commands = false,
		daily_notes = {
			folder = "Dailies",
			date_format = "%Y-%m-%d",
			default_tags = { "daily-notes" },
			template = "dailies",
		},
		completion = { blink = true, min_chars = 2 },
	}
	map("n", "<leader>fn", "<CMD>Obsidian search<CR>", opts "Find in notes")
	map("n", "<leader>ft", "<CMD>Obsidian tags<CR>", opts "Find by note tag")
	map("n", "<leader>nn", "<CMD>Obsidian new_from_template<CR>", opts "Create new note")
end

local renderOpts = {
	heading = {
		enabled = true,
		render_modes = true,
		sign = true,
		icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
		position = "overlay",
		signs = { "󰫎 " },
		width = "full",
		left_margin = 0,
		left_pad = 0,
		right_pad = 0,
		min_width = 0,
		border = false,
		border_virtual = false,
		border_prefix = false,
		above = "▄",
		below = "▀",
		backgrounds = {
			"RenderMarkdownH1Bg",
			"RenderMarkdownH2Bg",
			"RenderMarkdownH3Bg",
			"RenderMarkdownH4Bg",
			"RenderMarkdownH5Bg",
			"RenderMarkdownH6Bg",
		},
		foregrounds = {
			"RenderMarkdownH1",
			"RenderMarkdownH2",
			"RenderMarkdownH3",
			"RenderMarkdownH4",
			"RenderMarkdownH5",
			"RenderMarkdownH6",
		},
	},
	paragraph = {
		enabled = true,
		render_modes = true,
		left_margin = 0,
		min_width = 0,
	},
	code = {
		enabled = true,
		render_modes = true,
		sign = true,
		style = "full",
		position = "left",
		language_pad = 0,
		language_name = true,
		disable_background = { "diff" },
		width = "full",
		left_margin = 0,
		left_pad = 0,
		right_pad = 0,
		min_width = 0,
		border = "thin",
		above = "▄",
		below = "▀",
		highlight = "RenderMarkdownCode",
		highlight_language = nil,
		inline_pad = 0,
		highlight_inline = "RenderMarkdownCodeInline",
	},
	dash = {
		enabled = true,
		render_modes = true,
		icon = "─",
		width = "full",
		left_margin = 0,
		highlight = "RenderMarkdownDash",
	},
	bullet = {
		enabled = true,
		render_modes = true,
		left_pad = 0,
		right_pad = 0,
		highlight = "RenderMarkdownBullet",
	},
	checkbox = {
		enabled = true,
		render_modes = true,
		position = "inline",
		unchecked = {
			icon = "󰄱 ",
			highlight = "RenderMarkdownUnchecked",
			scope_highlight = nil,
		},
		checked = {
			icon = "󰱒 ",
			highlight = "RenderMarkdownChecked",
			scope_highlight = nil,
		},
	},
	quote = {
		enabled = true,
		render_modes = true,
		icon = "▋",
		repeat_linebreak = false,
		highlight = "RenderMarkdownQuote",
	},
	pipe_table = {
		enabled = true,
		render_modes = true,
		preset = "none",
		style = "full",
		cell = "padded",
		padding = 1,
		min_width = 0,
		border = {
			"┌",
			"┬",
			"┐",
			"├",
			"┼",
			"┤",
			"└",
			"┴",
			"┘",
			"│",
			"─",
		},
		alignment_indicator = "━",
		head = "RenderMarkdownTableHead",
		row = "RenderMarkdownTableRow",
		filler = "RenderMarkdownTableFill",
	},
	callout = {
		note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
		tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
		important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
		warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
		caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
		-- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
		question = { raw = "[!QUESTION]", rendered = "󰘥 Question", highlight = "RenderMarkdownWarn" },
		attention = { raw = "[!ATTENTION]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn" },
		danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
		error = { raw = "[!ERROR]", rendered = "󱐌 Error", highlight = "RenderMarkdownError" },
		bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
	},
	link = {
		enabled = true,
		render_modes = true,
		footnote = {
			superscript = true,
			prefix = "",
			suffix = "",
		},
		image = "󰥶 ",
		email = "󰀓 ",
		hyperlink = "󰌹 ",
		highlight = "RenderMarkdownLink",
		custom = {
			web = { pattern = "^http", icon = "󰖟 " },
		},
	},
	sign = {
		enabled = true,
		highlight = "RenderMarkdownSign",
	},
	indent = {
		enabled = false,
		render_modes = false,
		per_level = 2,
		skip_level = 1,
		skip_heading = false,
	},
}

require("render-markdown").setup(renderOpts)
map("n", "<leader>tm", function()
	local rm = require "render-markdown"
	local enabled = require("render-markdown.state").enabled
	if enabled then
		rm.disable()
	else
		rm.enable()
	end
end, opts "Toggle render markdown")
