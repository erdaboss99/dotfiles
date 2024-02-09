local wezterm = require "wezterm"
local mux = wezterm.mux

local super_vim_keys_map = {
	s = utf8.char(0xAA), -- <CMD-s>
	b = utf8.char(0xAB), -- <CMD-b>
}

local function bind_super_key_to_vim(key)
	return {
		key = key,
		mods = "CMD",
		action = wezterm.action_callback(function(win, pane)
			local char = super_vim_keys_map[key]
			if char then
				win:perform_action({ SendKey = { key = char, mods = nil } }, pane)
			else
				win:perform_action({ SendKey = { key = key, mods = "CMD" } }, pane)
			end
		end),
	}
end

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 15.0,
	macos_window_background_blur = 5,
	window_background_opacity = 0.9,
	font = wezterm.font_with_fallback {
		{
			family = "JetBrains Mono",
		},
		{
			family = "JetBrainsMono Nerd Font",
		},
	},
	use_cap_height_to_scale_fallback_fonts = true,
	window_decorations = "RESIZE",
	window_padding = {
		left = "1cell",
		right = "1cell",
		top = "0.5cell",
		bottom = "0cell",
	},
	exit_behavior = "CloseOnCleanExit",
	window_close_confirmation = "NeverPrompt",
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	use_dead_keys = false,
	keys = {
		bind_super_key_to_vim "s",
		bind_super_key_to_vim "b",
		{ key = "/", mods = "CTRL", action = wezterm.action { SendString = "\x1f" } },
	},
}
