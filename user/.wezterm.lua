-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Config

-- Color scheme:
config.color_scheme = 'Atelier Seaside Light (base16)' -- 'Atelierdune (dark) (terminal.sexy)' -- Colors (base16), Brewer (base16), Classic Dark (base16), ayu, Argonaut, Atelierdune (dark) (terminal.sexy)

-- Window
config.window_background_opacity = 0.85

config.hide_tab_bar_if_only_one_tab = true

-- Font
config.font = wezterm.font_with_fallback { 'JetBrainsMono', 'Noto Color Emoji', 'Noto Sans SC', 'YES24', 'Font Awesome 6 Free', }
config.font_size = 14
config.line_height = 1.0

-- and finally, return the configuration to wezterm
return config

