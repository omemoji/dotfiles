local wezterm = require 'wezterm'

return {
  window_close_confirmation = 'NeverPrompt',
  hide_tab_bar_if_only_one_tab = true,
  skip_close_confirmation_for_processes_named = { 'bash', 'sh', 'zsh', 'fish', 'tmux' },
  keys = {
    {
      key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentTab { confirm = false }
    },
  },
  window_background_opacity = 0.8,
  font = wezterm.font_with_fallback {
    'MesloLGS NF', 'Osaka', 'Noto Sans Mono CJK JP', 'Noto Color Emoji',
  },
  -- Enable Wayland support
  enable_wayland = false,
  -- font = wezterm.font("MesloLGS NF"),
  font_size = 13.0,
  -- -- Default color scheme
  -- colors = {
  --   -- The default text color
  --   foreground = "#dddddd",
  --   -- The default background color
  --   background = "202020",

  --   -- Overrides the cell background color when the current cell is occupied by the
  --   -- cursor and the cursor style is set to Block
  --   cursor_bg = "silver",
  --   -- Overrides the text color when the current cell is occupied by the cursor
  --   cursor_fg = "#FFFFFF",
  --   -- Specifies the border color of the cursor when the cursor style is set to Block,
  --   -- or the color of the vertical or horizontal bar when the cursor style is set to
  --   -- Bar or Underline.
  --   cursor_border = "#52ad70",

  --   -- the foreground color of selected text
  --   selection_fg = "black",
  --   -- the background color of selected text
  --   selection_bg = "#ffffff",

  --   -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  --   scrollbar_thumb = "#222222",

  --   -- The color of the split lines between panes
  --   split = "#444444",
  --   ansi = { "#1F1F1F","#FB002A","#ed8800", "#ccbb00", "#aaaa55", "#00bbbb",  "#009999", "#999999", },
  --   brights = { "#777777", "#FB002A","#Fcbb00", "#ffee11", "#ffffcc", "#88FFFF", "#00FFFF","#ffffff"  },
  --   -- Arbitrary colors of the palette in the range from 16 to 255
  --   indexed = { [136] = "#af8700" },
  --   -- Since: nightly builds only
  --   -- When the IME, a dead key or a leader key are being processed and are effectively
  --   -- holding input pending the result of input composition, change the cursor
  --   -- to this color to give a visual cue about the compose state.
  --   compose_cursor = "orange",
  -- },
  -- Color scheme: Kanagawa
  colors = {
    foreground = "#dcd7ba",
    background = "#202020",

    cursor_bg = "#c8c093",
    cursor_fg = "#c8c093",
    cursor_border = "#c8c093",

    selection_fg = "#c8c093",
    selection_bg = "#2d4f67",

    scrollbar_thumb = "#16161d",
    split = "#16161d",

    ansi = { "#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093" },
    brights = { "#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba" },
    indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
  },
}
