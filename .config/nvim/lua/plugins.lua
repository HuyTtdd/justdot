-- Reminder to myself: You are stupid so you didn't comment what option do what
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    -- These are neccessary for my flow
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "nvim-treesitter/nvim-treesitter" },
    { "nvim-lualine/lualine.nvim" },
    { "ibhagwan/fzf-lua" },
    { "nvim-tree/nvim-tree.lua" },
    { "lewis6991/gitsigns.nvim" },
    { "tpope/vim-fugitive" },
    { "sindrets/diffview.nvim" },
    { "alexghergh/nvim-tmux-navigation" },
    { "kylechui/nvim-surround" },
    { "m4xshen/autoclose.nvim" },
    { "windwp/nvim-autopairs" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
    { "kevinhwang91/nvim-bqf" },
    { "rmagatti/auto-session" },
    { "rrethy/vim-hexokinase" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-lua/plenary.nvim" },
    -- dap
    { "mfussenegger/nvim-dap" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" }
    },
    { "theHamsta/nvim-dap-virtual-text"},
    -- These are just for fun
    { "MeanderingProgrammer/markdown.nvim" },
    { "roobert/tabtree.nvim" },
    { "hiphish/rainbow-delimiters.nvim" },
    { "folke/twilight.nvim" },
    { "vidocqh/data-viewer.nvim" },
    { "eandrju/cellular-automaton.nvim" },
    { "jbyuki/nabla.nvim" },
    { "HakonHarnes/img-clip.nvim" },
    { "echasnovski/mini.indentscope", version = false },
    { "atinylittleshell/comment-repl.nvim", opts = {} },
    {
        "NStefan002/screenkey.nvim",
        version = "*",
    },
    -- AI shit
    { "Exafunction/codeium.vim" },
    {
        "GCBallesteros/jupytext.nvim",
        config = true,
        lazy=false,
    },
    -- Temporary rust stuff 
    -- {
    --   'mrcjkb/rustaceanvim',
    --   version = '^4',
    --   lazy = false,
    -- }
}


-- mason
require("mason").setup({})

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
    winopts = {
        preview = {
            scroll_bar = false,
        }
    },
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

-- Look, it's RAINBOWWWWW, Wahhhhh
local rainbow_delimiters = require 'rainbow-delimiters'
require("rainbow-delimiters.setup").setup({
    strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
    },
    query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
    },
    priority = {
        [""] = 110,
        lua = 210,
    },
    highlight = {
        "None",
        "RainbowDelimiterPink",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
    },
})

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
        tabc = "<C-CR>",
        tabdrop = "",
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

-- texmath
vim.keymap.set('n', '<leader>m', ':lua require("nabla").popup()<CR>', {noremap=true, silent=true})

-- twilight
require("twilight").setup({
    dimming = {
        alpha = 0.7,
        term_bg = "#000000",
        inactive = true,
      },
      context = 20,
      treesitter = true,
      expand = {
        "function_definition",
        "method_definition",
        "decorated_definition",
      },
      exclude = {},
})

-- Indent line go bruhhhh
require('mini.indentscope').setup({
    draw = {
        delay = 250,
    }
})

-- tab the tree
require('tabtree').setup({
    key_bindings = {
        next = "<Tab>",
        previous = "<S-Tab>",
    },
    language_configs = {
        python = {
            target_query = [[
              (identifier) @identifier_capture
              (true) @true_capture
              (false) @false_capture
              (none) @none_capture
              (string) @string_capture
              (integer) @integer_capture
              (class_definition) @class_definition
              (function_definition) @function_definition
              (for_statement) @for_statement
              (if_statement) @if_statement
              (match_statement) @match_statement
              (try_statement) @try_statement
              (while_statement) @while_statement
              (with_statement) @with_statement
              (assert_statement) @assert_statement
              (break_statement) @break_statement
              (continue_statement) @continue_statement
              (delete_statement) @delete_statement
              (exec_statement) @exec_statement
              (expression_statement) @expression_statement
              (future_import_statement) @future_import_statement
              (global_statement) @global_statement
              (import_from_statement) @import_from_statement
              (import_statement) @import_statement
              (nonlocal_statement) @nonlocal_statement
              (pass_statement) @pass_statement
              (print_statement) @print_statement
              (raise_statement) @raise_statement
              (return_statement) @return_statement
              (type_alias_statement) @type_alias_statement
            ]],
            offsets = {
                string_start_capture = 1,
            },
        },
        default_config = {
            target_query = [[
                (string) @string_capture
                (interpolation) @interpolation_capture
                (parameters) @parameters_capture
                (argument_list) @argument_list_capture
            ]],
            offsets = {},
        }
    },
})

-- Screenkey
require("screenkey").setup({
    win_opts = {
        relative = "editor",
        anchor = "SE",
        width = 30,
        height = 1,
        border = "single",
    },
    compress_after = 3,
    clear_after = 0,
    disable = {
        filetypes = {},
        buftypes = {},
    },
})

require("screenkey").toggle()

-- Markdown
require("render-markdown").setup({
    markdown_query = [[
        (atx_heading [
            (atx_h1_marker)
            (atx_h2_marker)
            (atx_h3_marker)
            (atx_h4_marker)
            (atx_h5_marker)
            (atx_h6_marker)
        ] @heading)

        (thematic_break) @dash

        (fenced_code_block) @code

        [
            (list_marker_plus)
            (list_marker_minus)
            (list_marker_star)
        ] @list_marker

        (task_list_marker_unchecked) @checkbox_unchecked
        (task_list_marker_checked) @checkbox_checked

        (block_quote (block_quote_marker) @quote_marker)
        (block_quote (paragraph (inline (block_continuation) @quote_marker)))

        (pipe_table) @table
        (pipe_table_header) @table_head
        (pipe_table_delimiter_row) @table_delim
        (pipe_table_row) @table_row
    ]],
    inline_query = [[
        (code_span) @code
    ]],
    log_level = "error",
    file_types = { "markdown" },
    render_modes = { "n", "c" },
    headings = { "#1 ", "#2 ", "#3 ", "#4 ", "#5 ", "#6 " },
    dash = "—",
    bullets = { "●", "○", "◆", "◇" },
    checkbox = {
        unchecked = "󰄱 ",
        checked = " ",
    },
    quote = "┃",
    conceal = {
        default = vim.opt.conceallevel:get(),
        rendered = 3,
    },
    fat_tables = true,
    highlights = {
        heading = {
            backgrounds = { "DiffAdd", "DiffChange", "DiffDelete" },
            foregrounds = {
                "markdownH1",
                "markdownH2",
                "markdownH3",
                "markdownH4",
                "markdownH5",
                "markdownH6",
            },
        },
        dash = "LineNr",
        code = "ColorColumn",
        bullet = "Normal",
        checkbox = {
            unchecked = "@markup.list.unchecked",
            checked = "@markup.heading",
        },
        table = {
            head = "@markup.heading",
            row = "Normal",
        },
        latex = "@markup.math",
        quote = "@markup.quote",
    },
})

-- rustaceanvim
vim.g.rustaceanvim = {
    tools = {},
    server = {cmd = {}, standalone = false},
}
