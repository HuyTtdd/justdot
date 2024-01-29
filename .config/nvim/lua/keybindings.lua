-- leader
vim.g.mapleader = ' ' -- This is a <space>, don't know why <space> not work

-- Tab block of code
vim.keymap.set('v', '>', '>gv', {noremap= true, silent=true})
vim.keymap.set('v', '<', '<gv', {noremap= true, silent=true})

-- Map jk to esc
vim.keymap.set('i', 'jk', '<ESC>l', {noremap= true, silent=true})

-- Select all text
vim.keymap.set('n', '<C-a>', '<C-\\><C-N>ggVG<CR>', {noremap= true, silent=true})

-- Select & change buffer
vim.keymap.set('n', '<leader>b', ':ls<CR>:b<leader>', {noremap= true})

-- Tabs control
vim.keymap.set('n', '<leader>t', ':tabnew<CR>', {noremap= true, silent=true})
vim.keymap.set('n', '<leader>h', 'gT', {noremap= true, silent=true})
vim.keymap.set('n', '<leader>l', 'gt', {noremap= true, silent=true})

-- System clipboard copy/paste
vim.keymap.set('n', '<leader>y', '"+y', {noremap= true})
vim.keymap.set('n', '<leader>d', '"+d', {noremap= true})
vim.keymap.set('n', '<leader>p', '"+p', {noremap= true})
vim.keymap.set('n', '<leader>P', '"+P', {noremap= true})
vim.keymap.set('v', '<leader>y', '"+y', {noremap= true})
vim.keymap.set('v', '<leader>d', '"+d', {noremap= true})
vim.keymap.set('v', '<leader>p', '"+p', {noremap= true})
vim.keymap.set('v', '<leader>P', '"+P', {noremap= true})

-- Quickly select text just be pasted
vim.keymap.set('n', 'gV', '`[v`]', {noremap= true, silent=true})

-- Swap windows
-- Vertical to horizontal
vim.keymap.set('n', '<leader>sj', '<C-w>t<C-w>K', {remap= true, silent=true})
-- Horizontal to vertical
vim.keymap.set('n', '<leader>sl', '<C-w>t<C-w>H', {remap= true, silent=true})

-- Remove highlight
vim.keymap.set('n', '<CR>', ':noh<CR>', {noremap= true, silent= true})

-- Saving
vim.keymap.set('n', '<leader>w', ':w<CR>', {noremap= true})

-- Resize window
vim.keymap.set('n', '<C-down>', ':resize +5<CR>', {noremap= true, silent=true})
vim.keymap.set('n', '<C-up>', ':vertical resize +5<CR>', {noremap= true, silent=true})

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
vim.keymap.set('n', '<leader>rf', rename_file, {noremap= true})

-- Show hightlight groups for current token
function syn_stack()
    if (not vim.fn.exists('*synctack'))
    then
        return
    end
    print(vim.cmd('echo synIDattr(synID(line("."), col("."), 1), "name")'))
end 
vim.keymap.set('n', '<C-S>', syn_stack, {remap= true})

-- Nvim's terminal
-- Navigate windows from any mode
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h', {noremap= true, silent=true})
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j', {noremap= true, silent=true})
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k', {noremap= true, silent=true})
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l', {noremap= true, silent=true})

-- Change to normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', {noremap= true, silent=true})

-- Clear all buffer except opening one
function bufclean()
    print('Clear inactive buffers.')
    for _, buffer in pairs(vim.fn.getbufinfo()) do
        if (not buffer['loaded'] and buffer['listed']) or buffer['name'] == "" or (buffer['hidden'] and buffer['listed'] and not buffer['changed']) then
            vim.cmd{cmd='bdelete', args={buffer['bufnr']}}
        end
    end
end
