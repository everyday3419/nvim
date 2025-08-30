return {
  "echasnovski/mini.files",
  lazy = false,
  keys = {
    {
      "<leader>e",
      function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local path = vim.fn.fnamemodify(bufname, ":p")

        if path and vim.uv.fs_stat(path) then
          require("mini.files").open(bufname, false)
        end
      end,
      desc = "File explorer",
    },
  },
  config = function()
    local mini_files = require "mini.files"
    mini_files.setup {}

    local function map_split(buf_id, lhs, direction)
      local function rhs()
        local window = mini_files.get_explorer_state().target_window

        if window == nil or mini_files.get_fs_entry().fs_type == "directory" then
          return
        end

        local new_target_window
        vim.api.nvim_win_call(window, function()
          vim.cmd(direction .. " split")
          new_target_window = vim.api.nvim_get_current_win()
        end)

        mini_files.set_target_window(new_target_window)
        mini_files.go_in { close_on_file = true }
      end

      vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. direction })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        map_split(buf_id, "<C-w>s", "belowright horizontal")
        map_split(buf_id, "<C-w>v", "belowright vertical")
      end,
    })
  end,
}
