local wezterm = require 'wezterm';

local function change_background(window)
    local window_dims = window:get_dimensions();
    local overrides = window.get_config;
    wezterm.log_error(overrides);
    -- overrides.colors.background = "#ffffff";
    -- if window_dims.is_full_screen then
    --     overrides.colors.background = "#ffffff";
    --     overrides.window_background_opacity = .78;
    --     overrides.window_background_image = "";
    -- else
    --     overrides.colors.background = "#000000";
    --     overrides.window_background_opacity = 1.0;
    --     overrides.window_background_image = "";
    -- end
    -- window:set_config_overrides(overrides);
end


wezterm.on("window-resized", function(window, pane)
    change_background(window)
end);


return {
    enable_wayland = false,
    -- font = wezterm.font({"Iosevka Fixed SS02 Extended", weight="Medium"}),
    warn_about_missing_glyphs = false,
    font = wezterm.font_with_fallback({
        -- "scientifica",
        "Iosevka Fixed SS02 Extended",
        {family="Iosevka Fixed SS02 Extended", italic=true},
        "Iosevka Nerd Font Mono"
    }),
    font_size = 11,
    -- font_size = 15.0,
    disable_default_key_bindings = true,
    enable_tab_bar = false,
    enable_scroll_bar = false,
    initial_rows = 24,
    window_decorations = "NONE",
    exit_behavior="Close",
    color_scheme = "Catppuccin Macchiato",
    colors = {
        -- foreground = "#ffffff",
        foreground = "#fce9f7",
        cursor_bg = "#f4b8e4",
        background = "#000000"
    },
    -- window_background_opacity = .83,
    -- window_background_opacity = .7,
    -- window_background_image = "",
    window_background_image_hsb = {
        -- brightness = 0.0175,
        brightness = 0.05,
        hue = 1.0,
        saturation=1.0,
    },
    -- text_background_opacity = 1.0,
    window_background_gradient = {
        -- colors = { '#000000', 'rgba(0, 0, 0, .9)', 'rgba(0, 0, 0, 0.3)', 'rgba(0, 0, 0, 0)'},
        colors = { '#000000', 'rgba(0, 0, 0, .9)', 'rgba(249, 205, 237, 0.3)', 'rgba(249, 205, 237, 0)'},
        -- colors = { '#000000', 'rgba(0, 0, 0, .7)', 'rgba(249, 205, 237, 0.3)', 'rgba(249, 205, 237, 0)'},
        -- colors = { '#000000', 'rgba(249, 205, 237, 0)'},
        orientation = { Linear = { angle = 40.0 } },
        -- orientation = {
        --     Radial = {
        --         cx = 0,
        --         cy = 1,
        --         radius = 2,
        --     }
        -- }
    },
    keys = {
        {key="c", mods="CTRL|SHIFT", action=wezterm.action.CopyTo("Clipboard")},
        {key="v", mods="CTRL|SHIFT", action=wezterm.action.PasteFrom("Clipboard")},
        {key="s", mods="CTRL|SHIFT", action=wezterm.action.ToggleFullScreen},
        {key="l", mods="CTRL|SHIFT", action=wezterm.action.ShowDebugOverlay},
        {key="r", mods="CTRL|SHIFT", action=wezterm.action.ReloadConfiguration},
    },
}
