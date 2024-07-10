local wezterm = require "wezterm"
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 14.0,
	-- macos_window_background_blur = 5,
	-- window_background_opacity = 0.9,
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
}
