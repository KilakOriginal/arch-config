local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
  -- broken as of 27/09/2024 'tsserver',  -- typescript/javascript
  'pylsp',  -- python
  'clangd', -- c/c++
  'neocmake',  -- cmake
  'bashls', -- bash
  'cssls',  -- css
  'html',   -- html
  'hls',    -- haskell
  'jsonls', -- json
  'jdtls',  -- java
  'zls',    -- zig
  'marksman',  -- markdown
  'ltex',   -- latex
  'eslint', -- eslint
  'lua_ls', -- lua
  'rust_analyzer',  -- rust
  'taplo',  -- toml
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({ ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Tab>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "ä", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "ö", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
