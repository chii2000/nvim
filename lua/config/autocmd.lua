local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Settings for filetypes:
vim.cmd('autocmd bufnewfile,bufread *.typ set filetype=typst')
