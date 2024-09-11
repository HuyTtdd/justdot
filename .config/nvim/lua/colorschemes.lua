vim.cmd.colorscheme "catppuccin"

local colors = require("catppuccin.palettes").get_palette("macchiato")
colors.none = "NONE"

require("catppuccin").setup({
    flavor="macchiato",
    transparent_background = true,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0,
    },
    intergrations = {
        treesitter = true,
    },
    custom_highlights = {
        Comment = { fg = colors.overlay1 },
        LineNr = { fg = colors.pink },
        NvimTreeFolderName = { fg = colors.pink },
        NvimTreeOpenedFolderName = { fg = colors.pink },
        CursorLineNr = { fg = colors.lavender },
        DiagnosticVirtualTextError = { bg = colors.none },
        DiagnosticVirtualTextWarn = { bg = colors.none },
        DiagnosticVirtualTextInfo = { bg = colors.none },
        DiagnosticVirtualTextHint = { bg = colors.none },
        DiagnosticUnnecessary = {},
        NormalFloat = { fg = colors.text, bg = colors.none },
        FloatBorder = { fg = colors.pink, bg = colors.none },
        Pmenu = { bg = colors.none, fg = colors.overlay2 },
        PmenuSel = { bg = "#4a3a50" },
        PmenuSbar = { bg = colors.none },
        PmenuThumb = { bg = colors.none },
        Visual = { bg = "#4a3a50" },
        Todo = { bg = colors.none, fg = colors.none, style = { "bold" } },
        BqfPreviewFloat = { bg = colors.none},
        RainbowDelimiterPink = { fg = colors.pink },
        ["@text.uri"] = { link = "Comment" },
        ColorColumn = { bg = colors.none },
        ["@keyword.operator"] = { link = "Keyword" },
    }
})

local custom_lualine_colors = {
    normal = {
        a = { bg = colors.pink, fg = colors.mantle, gui = "bold" },
        b = { bg = colors.surface1, fg = colors.pink },
        c = { bg = colors.base, fg = "#f9cded" },
        y = { bg = colors.surface1, fg = colors.pink },
        z = { bg = colors.pink, fg = colors.mantle },
    },

    insert = {
        a = { bg = colors.green, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface1, fg = colors.pink },
        y = { bg = colors.surface1, fg = colors.pink },
        z = { bg = colors.pink, fg = colors.mantle },
    },

    terminal = {
        a = { bg = colors.green, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface1, fg = colors.pink },
        y = { bg = colors.surface1, fg = colors.pink },
        z = { bg = colors.pink, fg = colors.mantle },
    },

    command = {
        a = { bg = colors.peach, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface1, fg = colors.pink },
        y = { bg = colors.surface1, fg = colors.pink },
        z = { bg = colors.pink, fg = colors.mantle },
    },

    visual = {
        a = { bg = colors.mauve, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface1, fg = colors.pink },
        y = { bg = colors.surface1, fg = colors.pink },
        z = { bg = colors.pink, fg = colors.mantle },
    },

    replace = {
        a = { bg = colors.red, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface1, fg = colors.pink },
        y = { bg = colors.surface1, fg = colors.pink },
        z = { bg = colors.pink, fg = colors.mantle },
    },

    inactive = {
        a = { bg = colors.none, fg = colors.blue },
        b = { bg = colors.none, fg = colors.surface1 },
        c = { bg = colors.base, fg = colors.pink },
    },
}

require("lualine").setup({
    options={
        theme=custom_lualine_colors
    }
})

-- There is something wrong here that cause me to change the background to something else before change it back to "dark"
-- Too lazy to find a fix, so...
vim.opt.background = "light"
vim.opt.background = "dark"
