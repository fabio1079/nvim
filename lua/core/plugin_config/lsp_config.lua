require("mason").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls",
      "pylsp",
      "tsserver",
      "tailwindcss",
    },
}


require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

require("lspconfig").pylsp.setup {
  capabilities = capabilities,
}

require("lspconfig").tsserver.setup {
  capabilities = capabilities,
}

require("lspconfig").tailwindcss.setup {
  capabilities = capabilities,
}

