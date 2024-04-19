local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Change leader to a comma
vim.g.mapleader = " "

-- Map Esc to kk
map('i', 'jj', '<Esc>')


-- bifferline
map('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
map('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- neo-tree
map("n", "<Leader>nn", ":Neotree toggle<Return>", opts)

--toggleterm
map("n", "<Leader>t", "<cmd>ToggleTerm direction=float size=1<CR>", {})
