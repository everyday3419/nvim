return {
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match "error" and " " or " "
      return icon .. count
    end,
    themable = true,
    highlights = {
      buffer_selected = { italic = false },
      diagnostic_selected = { italic = false },
      hint_selected = { italic = false },
      pick_selected = { italic = false },
      pick_visible = { italic = false },
      pick = { italic = false },
    },
    offsets = {
      { filetype = "NvimTree", highlight = "NvimTreeNormal" },
    },
  },
}
