local dap = require('dap')
dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
            type = 'server',
            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            host = host,
            options = {
                source_filetype = 'python',
            },
        })
    else
        cb({
            type = 'executable',
            command = '/path/to/python',
            args = { '-m', 'debugpy.adapter' },
            options = {
                source_filetype = 'python',
            },
        })
    end
end

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return 'python'
            end
        end;
    },
}

local dapui = require('dapui')
dapui.setup()
require('nvim-dap-virtual-text').setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

vim.keymap.set("n", "<F3>", dap.close, { noremap = true, silent = true })
vim.keymap.set("n", "<F4>", dapui.toggle, { noremap = true, silent = true })
vim.keymap.set("n", "<F5>", dap.continue, { noremap = true, silent = true })
vim.keymap.set("n", "<F6>", dap.step_over, { noremap = true, silent = true })
vim.keymap.set("n", "<F7>", dap.step_into, { noremap = true, silent = true })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { noremap = true, silent = true })
