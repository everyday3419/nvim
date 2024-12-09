return {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--no-ignore",
    },
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "top" },
    },
    file_ignore_patterns = {
      "node_modules",
    },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },

  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!.git/*" },
    },
  },
}
