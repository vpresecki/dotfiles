local wezterm = require 'wezterm'

local config = {
    color_scheme = 'Material Palenight',
    initial_cols = 150,
    initial_rows = 40,
    window_background_opacity = 1.0,
    window_background_image = '/Users/vp/.config/wezterm/bg.jpg',
    window_background_image_hsb = {
        brightness = 0.19,
        hue = 1.0,
        saturation = 1.0
    },
    font = wezterm.font('FiraCode Nerd Font'),
    font_size= 13.3,
    window_close_confirmation = 'AlwaysPrompt',
    window_frame = {
        active_titlebar_bg = '#0a0a0a',
        border_left_width = '0.5cell',
        border_bottom_height = '0.25cell',
        border_top_height = '0.25cell',
        border_bottom_color = '#009496',
        border_top_color = '#009496',
    },
    window_padding = {
        left = 2,
        right = 2,
        top = 2,
        bottom = 2
    },
    keys = {
	    {key=" ", mods="CTRL", action=wezterm.action{SendString="\x00"}}
    } 
}

return config

