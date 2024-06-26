return {
    {
        'williamboman/mason.nvim',
        config = function()
            local mason = require("mason")
            mason.setup()
        end,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp' },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = {"lua_ls", "rust_analyzer", "clangd", "pyright"}
            })
              -- Enable completion triggered by <c-x><c-o>
            --vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
            --[[]
            require("lspconfig")[rust_anayzer].setup{
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            }
            ]]--
        end,
        init = function ()
            require('mason-lspconfig').setup_handlers({ function (server)
            local opt = {
                capabilities = require('cmp_nvim_lsp').default_capabilities(
                --vim.lsp.protocol.make_client_capabilities()
                )

            }
            require('lspconfig')[server].setup(opt)
            end })
        end,
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup {}
            lspconfig.typst_lsp.setup {
                root_dir = lspconfig.util.root_pattern(".git"),
 --               cmd = { "typst-lsp" },
--                filetypes = { "typst" },
            }
            lspconfig.clangd.setup {}
            lspconfig.lua_ls.setup {
                on_attach = on_attach
            }
            lspconfig.ocamllsp.setup {
                root_dir = lspconfig.util.root_pattern(".git"),
            }

            lspconfig.rust_analyzer.setup {
                root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json", ".git"),
            }
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local opts = { noremap=true, silent=true }
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap=true, silent=true, buffer=bufnr }
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
            end
        end,
    },
}

