-- Reminder to myself: You are stupid so you didn't comment what option do what

require("packer").startup(function(use)
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "nvim-lualine/lualine.nvim" }
    use { "ibhagwan/fzf-lua" }
    use { "nvim-tree/nvim-tree.lua" }
    use { "terrortylor/nvim-comment" }
    use { "lewis6991/gitsigns.nvim" }
    use { "kylechui/nvim-surround" }
    use { "alexghergh/nvim-tmux-navigation" }
    use { "m4xshen/autoclose.nvim" }
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        }
    }
    use { "nvim-treesitter/nvim-treesitter" }
    use { "nvim-treesitter/playground" }
    use { "windwp/nvim-autopairs" }
    use { "kevinhwang91/nvim-bqf" }
    use { "mfussenegger/nvim-dap" }
    use { "rmagatti/auto-session" }
    use { "rrethy/vim-hexokinase" }
    use { "nvim-tree/nvim-web-devicons" }
    use { "nvim-lua/plenary.nvim" }
    use { "vidocqh/data-viewer.nvim" }
    use { "tpope/vim-fugitive" }
    use { "sindrets/diffview.nvim" }
    use { "3rd/image.nvim" }
    use { "eandrju/cellular-automaton.nvim" }
    use { "nvim-neorg/neorg" }
    use { "jbyuki/nabla.nvim" }
    use { "HakonHarnes/img-clip.nvim" }
end)

-- Pairing stuff
require("nvim-autopairs").setup({})

-- The fucking line
function vim_columns()
    return vim.o.columns
end

require("lualine").setup({
    options = {
        icons_enabled = false,
        section_separators = "",
        component_separators = "|",
        always_show_tabs = true
    },
    sections = {
        lualine_b = {}
    },
    tabline = {
        lualine_c = {
            {
                "tabs",
                use_mode_colors = false,
                mode = 2,
                max_length = vim_columns,
                tabs_color = {
                    active = { bg = "#8e718b", fg = "#f9cded", gui = "bold" },
                    inactive = { fg = "#f9cded" }
                },
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" }
            }
        }
    }
})

-- Fuzzy search
require("fzf-lua").setup({
    files = {
        fzf_opts = {
            ["--layout"] = "default"
        }
    }
})
vim.keymap.set("n", "<C-p>", ":FzfLua files<CR>", { noremap = true, silent = true })

-- The fucking tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    renderer = {
        add_trailing = true,
        icons = {
            show = {
                file = false,
                folder = false
            },
            glyphs = {
                folder = {
                    arrow_closed = "+",
                    arrow_open = "-",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "M",
                    staged = "S",
                    unmerged = "uM",
                    renamed = "Rn",
                    untracked = "U",
                    deleted = "D",
                    ignored = "I",
                }
            }
        }
    },
    filters = {
        git_ignored = false,
    }
})
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- For commenting out the bug
require("nvim_comment").setup({
    create_mappings = false
})
vim.keymap.set("n", "<C-/>", ":CommentToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-/>", ":CommentToggle<CR>gv", { noremap = true, silent = true })

-- To show the git thingy
require("gitsigns").setup({
    signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "-" },
        topdelete    = { text = "-" },
        changedelete = { text = "~" },
        untracked    = { text = "" },
    }
})

-- Nvim surround
require("nvim-surround").setup()

-- Tmux navigation
require("nvim-tmux-navigation").setup({
    disable_when_zoomed = true
})
vim.keymap.set("n", "<A-h>", ":NvimTmuxNavigateLeft<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":NvimTmuxNavigateDown<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":NvimTmuxNavigateUp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":NvimTmuxNavigateRight<CR>", { noremap = true, silent = true })

-- Auto close parenthesis -- Don't know why the fuck I need a plugin for this
require("autoclose").setup()

-- Treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "javascript" },
    highlight = {
        enable = true
    },
    indent = {
        enable = true,
    }
})

-- Quickfix window
-- Funny that I have to disable every keymaps of this plugin
require("bqf").setup({
    auto_enable = true,
    auto_resize_height = true,
    filter = {
        fzf = {
            action_for = {
                [""] = "closeall",
                [""] = "signtoggle",
                [""] = "split",
                [""] = "tab drop",
                [""] = "vsplit",
                [""] = "split"
            },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " }
        }
    },
    func_map = {
        drop = "<CR>",
        filter = "",
        filterr = "",
        fzffilter = "",
        lastleave = "",
        nextfile = "",
        nexthist = "",
        open = "",
        openc = "",
        prevfile = "",
        prevhist = "",
        pscrolldown = "",
        pscrollorig = "",
        pscrollup = "",
        ptoggleauto = "",
        ptoggleitem = "",
        ptogglemode = "",
        sclear = "",
        split = "",
        stogglebuf = "",
        stoggledown = "",
        stoggleup = "",
        stogglevm = "",
        tab = "",
        tabb = "",
        tabc = "",
        tabdrop = "<C-CR>",
        vsplit = ""
    },
    magic_window = true,
    preview = {
        auto_preview = true,
        border = "rounded",
        buf_label = true,
        delay_syntax = 80,
        show_scroll_bar = false,
        show_title = false,
        win_height = 12,
        win_vheight = 12,
        winblend = 0,
        wrap = false
    },
    previous_winid_ft_skip = {}
})

-- Session sesssion session SESSION SEEEESSION sdkfjaslkdfj
require("auto-session").setup({
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
})

-- Show image in nvim
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

require("image").setup({
    backend = "kitty",
    integrations = {
        markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown" },
        },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = 5,
    max_height_window_percentage = 5,
    window_overlap_clear_enabled = false,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    editor_only_render_when_focused = false,
    tmux_show_only_in_active_window = false,
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
})

-- neorg
require("neorg").setup({
    load = {
        ["core.ui"] = {},
        ["core.dirman"] = {},
        ["core.autocommands"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.esupports.hop"] = {},
        ["core.clipboard"] = {},
        ["core.qol.todo_items"] = {},
        ["core.completion"] = { config = { engine = "nvim-cmp" } },
        ["core.concealer"] = {},
        ["core.highlights"] = {},
    }
})

-- texmath
vim.keymap.set('n', '<leader>m', ':lua require("nabla").popup()<CR>', {noremap=true, silent=true})
