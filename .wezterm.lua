local wezterm = require 'wezterm';
return {
    enable_wayland = true,
    audible_bell = "Disabled";
    warn_about_missing_glyphs = false,
    font = wezterm.font_with_fallback({
        "Iosevka Fixed Extended",
        {family="Iosevka Fixed Extended", italic=true},
        "Iosevka Nerd Font Mono"
    }),
    font_size = 11.5,
    enable_tab_bar = false,
    enable_scroll_bar = false,
    initial_rows = 24,
    initial_cols = 80,
    window_decorations = "NONE",
    exit_behavior="Close",
    color_scheme = "Catppuccin Macchiato",
    colors = {
        foreground = "#fce9f7",
        cursor_bg = "#f4b8e4",
        background = "#000000"
    },
    window_background_image_hsb = {
        brightness = 0.05,
        hue = 1.0,
        saturation=1.0,
    },
    window_background_gradient = {
        -- colors = { '#000000', 'rgba(0, 0, 0, .9)', 'rgba(249, 205, 237, 0.3)', 'rgba(249, 205, 237, 0)'},
        colors = { '#000000', 'rgba(0, 0, 0, 1)', 'rgba(249, 205, 237, 1)', 'rgba(249, 205, 237, 1)'},
        orientation = { Linear = { angle = 40.0 } },
    },
    window_background_opacity = 0.75,
    disable_default_key_bindings = true,
    keys = {
        {key="c", mods="CTRL|SHIFT", action=wezterm.action.CopyTo("Clipboard")},
        {key="v", mods="CTRL|SHIFT", action=wezterm.action.PasteFrom("Clipboard")},
        {key="s", mods="CTRL|SHIFT", action=wezterm.action.ToggleFullScreen},
        {key="l", mods="CTRL|SHIFT", action=wezterm.action.ShowDebugOverlay},
        {key="r", mods="CTRL|SHIFT", action=wezterm.action.ReloadConfiguration},
    },
}
