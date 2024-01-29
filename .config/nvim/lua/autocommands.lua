-- Map file type
auto_ft_grp = vim.api.nvim_create_augroup("AutoFtGrp", {clear = true})
-- Assembly filetype
vim.api.nvim_create_autocmd(
    {"BufNew", "BufRead"},
    {
        pattern="*.asm,*.s",
        command="setlocal ft=nasm",
        group=auto_ft_grp
    }
)
-- Latex filetype
vim.api.nvim_create_autocmd(
    {"BufNew", "BufRead"},
    {
        pattern="*.tex",
        command="setlocal ft=plaintex",
        group=auto_ft_grp
    }
)

-- Intergate terminal's config
vim.api.nvim_create_autocmd(
    "TermOpen",
    {
        pattern="*",
        command="setlocal nonumber norelativenumber signcolumn=no"
    }
)

-- Javascript specific config
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern="javascript.jsx",
        command="setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2"
    }
)

-- Markdown specific config
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        pattern="markdown",
        command="setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2"
    }
)

-- Json specific config
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern="json",
        command="setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2"
    }
)

-- CSS specifig config
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern="css,scss",
        command="setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2"
    }
)

-- SQL reserved keyword
vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern="sql",
        command="lua set_sql_abbr()"
    }
)

function set_sql_abbr()
    vim.cmd{cmd='ia', args={'this', 'THIS'}}
    vim.cmd{cmd='ia', args={'add', 'ADD'}}
    vim.cmd{cmd='ia', args={'all', 'ALL'}}
    vim.cmd{cmd='ia', args={'alter', 'ALTER'}}
    vim.cmd{cmd='ia', args={'and', 'AND'}}
    vim.cmd{cmd='ia', args={'any', 'ANY'}}
    vim.cmd{cmd='ia', args={'as', 'AS'}}
    vim.cmd{cmd='ia', args={'asc', 'ASC'}}
    vim.cmd{cmd='ia', args={'between', 'BETWEEN'}}
    vim.cmd{cmd='ia', args={'case', 'CASE'}}
    vim.cmd{cmd='ia', args={'check', 'CHECK'}}
    vim.cmd{cmd='ia', args={'column', 'COLUMN'}}
    vim.cmd{cmd='ia', args={'constraint', 'CONSTRAINT'}}
    vim.cmd{cmd='ia', args={'create', 'CREATE'}}
    vim.cmd{cmd='ia', args={'database', 'DATABASE'}}
    vim.cmd{cmd='ia', args={'default', 'DEFAULT'}}
    vim.cmd{cmd='ia', args={'delete', 'DELETE'}}
    vim.cmd{cmd='ia', args={'desc', 'DESC'}}
    vim.cmd{cmd='ia', args={'distinct', 'DISTINCT'}}
    vim.cmd{cmd='ia', args={'drop', 'DROP'}}
    vim.cmd{cmd='ia', args={'exec', 'EXEC'}}
    vim.cmd{cmd='ia', args={'exists', 'EXISTS'}}
    vim.cmd{cmd='ia', args={'from', 'FROM'}}
    vim.cmd{cmd='ia', args={'having', 'HAVING'}}
    vim.cmd{cmd='ia', args={'in', 'IN'}}
    vim.cmd{cmd='ia', args={'index', 'INDEX'}}
    vim.cmd{cmd='ia', args={'join', 'JOIN'}}
    vim.cmd{cmd='ia', args={'like', 'LIKE'}}
    vim.cmd{cmd='ia', args={'limit', 'LIMIT'}}
    vim.cmd{cmd='ia', args={'not', 'NOT'}}
    vim.cmd{cmd='ia', args={'or', 'OR'}}
    vim.cmd{cmd='ia', args={'procedure', 'PROCEDURE'}}
    vim.cmd{cmd='ia', args={'rownum', 'ROWNUM'}}
    vim.cmd{cmd='ia', args={'select', 'SELECT'}}
    vim.cmd{cmd='ia', args={'set', 'SET'}}
    vim.cmd{cmd='ia', args={'table', 'TABLE'}}
    vim.cmd{cmd='ia', args={'top', 'TOP'}}
    vim.cmd{cmd='ia', args={'union', 'UNION'}}
    vim.cmd{cmd='ia', args={'unique', 'UNIQUE'}}
    vim.cmd{cmd='ia', args={'update', 'UPDATE'}}
    vim.cmd{cmd='ia', args={'values', 'VALUES'}}
    vim.cmd{cmd='ia', args={'view', 'VIEW'}}
    vim.cmd{cmd='ia', args={'where', 'WHERE'}}
end
