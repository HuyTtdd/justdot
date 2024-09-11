-- leader
vim.g.mapleader = ' ' -- This is a <space>, don't know why <space> not work

-- remap q:
vim.keymap.set('n', 'q;', ':<C-f>', { silent=true })
vim.keymap.set('n', 'q:', '<Nop>')

-- Tab block of code
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Map jk to esc
vim.keymap.set('i', 'jk', '<ESC>l')

-- Select all text
vim.keymap.set('n', '<C-a>', '<C-\\><C-N>ggVG<CR>')

-- Select & change buffer
-- vim.keymap.set('n', '<leader>b', ':ls<CR>:b<space>')

-- Tabs control
vim.keymap.set('n', '<leader>t', ':tabnew<CR>', { silent=true })
vim.keymap.set('n', '<leader>h', 'gT')
vim.keymap.set('n', '<leader>l', 'gt')

-- System clipboard copy/paste
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>d', '"+d')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P')

-- Quickly select text
vim.keymap.set('n', 'gV', '`[v`]')

-- Swap windows
-- Vertical to horizontal
vim.keymap.set('n', '<leader>sj', '<C-w>t<C-w>K')
-- Horizontal to vertical
vim.keymap.set('n', '<leader>sl', '<C-w>t<C-w>H')

-- Remove highlight
vim.keymap.set('n', '<CR>', ':noh<CR>', {silent= true})

-- Saving
vim.keymap.set('n', '<leader>w', ':w<CR>')

-- Resize window
vim.keymap.set('n', '<C-down>', ':resize +5<CR>', {silent=true})
vim.keymap.set('n', '<C-up>', ':vertical resize +5<CR>', {silent=true})

-- split line, as oppose to J
vim.keymap.set('n', 'E', 'hylpr<CR>')

-- Rename current file
function rename_file()
    local oldname = vim.api.nvim_buf_get_name(0)
    local newname = vim.fn.input('New file name: ', oldname, 'file')
    if (newname ~= oldname and newname ~= '')
    then
        vim.cmd{cmd='saveas', args={newname}}
        io.popen('rm ' .. oldname)
        vim.cmd{cmd='redraw'}
    end
end
vim.keymap.set('n', '<leader>rf', rename_file)

-- Show hightlight groups for current token
function syn_stack()
    if (not vim.fn.exists('*synctack'))
    then
        return
    end
    print(vim.cmd('echo synIDattr(synID(line("."), col("."), 1), "name")'))
end 
vim.keymap.set('n', '<C-S>', syn_stack)

-- Nvim's terminal
-- Navigate windows from any mode
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l')

-- Change to normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>')

-- Clear all buffer except opening one
function bufclean()
    print('Clear inactive buffers.')
    for _, buffer in pairs(vim.fn.getbufinfo()) do
        if (not buffer['loaded'] and buffer['listed']) or buffer['name'] == "" or (buffer['hidden'] and buffer['listed'] and not buffer['changed']) then
            vim.cmd{cmd='bdelete', args={buffer['bufnr']}}
        end
    end
end

-- Commenting out the bug
-- This support to be <C-/>, but I don't know why it not work sometime but <C-_> works. Just notice that it work or not depend on file type.
-- You still press Ctrl + / on the keyboard.
vim.keymap.set("n", "<C-_>", "gcc", {remap=true})
vim.keymap.set("n", "<C-/>", "gcc", {remap=true})
vim.keymap.set("v", "<C-_>", "gc", {remap=true})
vim.keymap.set("v", "<C-/>", "gc", {remap=true})

-- Navigate logical line
vim.keymap.set({"n", "v"}, "j", "gj")
vim.keymap.set({"n", "v"}, "k", "gk")
