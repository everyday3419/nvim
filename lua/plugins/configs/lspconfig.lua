-- Use LspAttach autocommand to only map the following keys
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = ev.buf })
    vim.keymap.set(
      "n",
      "gvd",
      "<cmd>vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>",
      { desc = "Go to declaration in vertical split", buffer = ev.buf }
    )
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information in vertical split", buffer = ev.buf })
    vim.keymap.set(
      "n",
      "gvi",
      "<cmd>vsplit<CR><cmd>lua vim.lsp.buf.implementation()<CR>",
      { desc = "Go to implementation", buffer = ev.buf }
    )
    vim.keymap.set(
      "n",
      "gvd",
      "<cmd>vsplit<CR><cmd>lua vim.lsp.buf.definition()<CR>",
      { desc = "Go to declaration", buffer = ev.buf }
    )
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help", buffer = ev.buf })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = ev.buf })
    vim.keymap.set(
      "n",
      "<space>wa",
      vim.lsp.buf.add_workspace_folder,
      { desc = "Add workspace folder", buffer = ev.buf }
    )
    vim.keymap.set(
      "n",
      "<space>wr",
      vim.lsp.buf.remove_workspace_folder,
      { desc = "Remove workspace folder", buffer = ev.buf }
    )
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = "List workspace folders", buffer = ev.buf })
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = ev.buf })
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = ev.buf })
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Show code actions", buffer = ev.buf })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references", buffer = ev.buf })
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}
-- Setup language servers.
local lspconfig = require "lspconfig"

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
}

-- lspconfig.rust_analyzer.setup {
--   capabilities = capabilities,
--   filetypes = { "rust" },
--   root_dir = lspconfig.util.root_pattern "Cargo.toml",
--   settings = {
--     ["rust-analyzer"] = {
--       check = {
--         allFeatures = true,
--       },
--     },
--   },
-- }

lspconfig.ts_ls.setup {
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern "package.json",
  single_file_support = false,
}

lspconfig.denols.setup {
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.gopls.setup {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
}

lspconfig.prismals.setup {
  capabilities = capabilities,
}

-- setup multiple servers with same default options
local servers = { "html", "cssls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end
