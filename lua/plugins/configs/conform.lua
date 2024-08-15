require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    go = { "goimports" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
    quiet = true,
  },
}
