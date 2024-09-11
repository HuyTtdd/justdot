-- Reminder to myself: You are stupid so you didn't comment what option do what
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
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
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
    { "kevinhwang91/nvim-bqf" },
    { "rmagatti/auto-session" },
    { "NvChad/nvim-colorizer.lua" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-lua/plenary.nvim" },
    -- dap
    { "mfussenegger/nvim-dap" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" }
    },
    { "theHamsta/nvim-dap-virtual-text"},
    -- These are just for fun | Nice to have
    { "jiaoshijie/undotree" },
    { "hedyhli/outline.nvim" },
    { "shortcuts/no-neck-pain.nvim", version = "*" },
    {
        'altermo/ultimate-autopair.nvim',
        event={'InsertEnter','CmdlineEnter'},
    },
    { "sQVe/sort.nvim" },
    { "MeanderingProgrammer/markdown.nvim" },
    { "roobert/tabtree.nvim" },
    { "folke/twilight.nvim" },
    { "vidocqh/data-viewer.nvim" },
    { "eandrju/cellular-automaton.nvim" },
    { "jbyuki/nabla.nvim" },
    { "echasnovski/mini.indentscope", version = false },
    { "atinylittleshell/comment-repl.nvim", opts = {} },
    {
        "NStefan002/screenkey.nvim",
        version = "*",
    },
    -- AI shit
    -- { "Exafunction/codeium.vim" },
    -- {
    --     "GCBallesteros/jupytext.nvim",
    --     config = true,
    --     lazy=false,
    -- },
}

-- mason
require("mason").setup({})

-- Pairing stuff
require("ultimate-autopair").setup({})

-- The fucking line
local function vim_columns()
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
        lualine_b = {'branch'}
    },
    tabline = {
        lualine_c = {
            {
                "tabs",
                use_mode_colors = false,
                mode = 2,
                max_length = vim_columns,
                tabs_color = {
                    -- active = { bg = "#494d64", fg = "#f9cded", gui = "bold" },
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
            scrollbar = false
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

-- COLORRRRR
require("colorizer").setup {
    user_default_options = {
        mode = "virtualtext",
        virtualtext = "■",
    },
}

-- Tmux navigation
require("nvim-tmux-navigation").setup({
    disable_when_zoomed = true
})
vim.keymap.set("n", "<A-h>", ":NvimTmuxNavigateLeft<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", ":NvimTmuxNavigateDown<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":NvimTmuxNavigateUp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":NvimTmuxNavigateRight<CR>", { noremap = true, silent = true })

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
        win_height = 30,
        win_vheight = 30,
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
    clear_after = 1000,
    disable = {
        filetypes = {},
        buftypes = {},
    },
    show_leader = false,
    group_mappings = false,
    display_infront = {},
    display_behind = {},
    keys = {
        ["<TAB>"] = "󰌒",
        ["<CR>"] = "󰌑",
        ["<ESC>"] = "<Esc>",
        ["<SPACE>"] = "␣",
        ["<BS>"] = "󰌥",
        ["<DEL>"] = "<Del>",
        ["<LEFT>"] = "",
        ["<RIGHT>"] = "",
        ["<UP>"] = "",
        ["<DOWN>"] = "",
        ["<HOME>"] = "<Home>",
        ["<END>"] = "<End>",
        ["<PAGEUP>"] = "<PgUp>",
        ["<PAGEDOWN>"] = "<PgDn>",
        ["<INSERT>"] = "<Ins>",
        ["<F1>"] = "<F1>",
        ["<F2>"] = "<F2>",
        ["<F3>"] = "<F3>",
        ["<F4>"] = "<F4>",
        ["<F5>"] = "<F5>",
        ["<F6>"] = "<F6>",
        ["<F7>"] = "<F7>",
        ["<F8>"] = "<F8>",
        ["<F9>"] = "<F9>",
        ["<F10>"] = "<F10>",
        ["<F11>"] = "<F11>",
        ["<F12>"] = "<F12>",
        ["CTRL"] = "<Ctrl>",
        ["ALT"] = "<Alt>",
        ["SUPER"] = "<Super>",
        ["<leader>"] = "<leader>",
    },
})

-- Markdown
require("render-markdown").setup({
    win_options = {
        conceallevel = {
            default = vim.api.nvim_get_option_value('conceallevel', {}),
            rendered = 1,
        },
        concealcursor = {
            default = vim.api.nvim_get_option_value('concealcursor', {}),
            rendered = "",
        };
    },
    code = {
        above = "",
        below = "",
    }
})

-- Sort
require("sort").setup()

-- My neck
require("no-neck-pain").setup({
    width = 150,
})

-- Outline
require("outline").setup({
    outline_window = {
        position = "left",
        auto_jump = true,
        show_cursorline = true,
    }
})

-- Undotree
require("undotree").setup({
    float_diff = true,
    layout = "left_bottom",
    position = "left",
})
vim.keymap.set("n", "<leader>u", ":lua require('undotree').toggle()<cr>", { noremap = true, silent = true })
