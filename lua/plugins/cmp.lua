return   {

    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',

    },
    config = function ()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function (args)

            vim.fn['vsnip#anonymous'](args.body)
          end,
        },
        sources = cmp.config.sources({

          { name = 'nvim_lsp' },
          { name = 'vsnip' },

        }, {
          { name = 'buffer' }
        }),
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.abort(),
          --["<Caps_Lock>"] = cmp.mapping.confirm({ select = true })
        }),
        experimental = {
          ghost_text = true,
        },
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },

        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }

        }),
      })
    end,

  }
