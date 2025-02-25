return {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettierd" },
    go = { "goimports" },
    python = { "ruff_format" },
    solidity = { "prettier", "prettierd" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
    quiet = true,
  },
}
