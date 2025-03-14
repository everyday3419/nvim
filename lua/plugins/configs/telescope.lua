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
      "%.git",
      "*-lock.json",
    },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<esc>"] = "close",
      },
    },
  },

  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!.git/*" },
      theme = "ivy",
      previewer = false,
    },
    buffers = {
      theme = "ivy",
      previewer = false,
    },
    oldfiles = {
      theme = "ivy",
      previewer = false,
    },
    live_grep = {
      theme = "ivy",
    },
    current_buffer_fuzzy_find = {
      theme = "ivy",
    },
  },
}
