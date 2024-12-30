local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular' })
config.font_size = 18.0
config.line_height = 1.2
config.color_scheme = 'zenwritten_light'
config.window_decorations = 'RESIZE'

config.hide_mouse_cursor_when_typing = false
config.hide_tab_bar_if_only_one_tab = true

config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.freetype_load_target = 'HorizontalLcd'

config.window_padding = {
  left    =  16,
  right   =  16,
  top     =  16,
  bottom  =  16,
}

return config
