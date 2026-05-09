return {
  -- Kill bottom statusline
  { "nvim-lualine/lualine.nvim", enabled = false },

  -- Kill top bufferline
  { "akinsho/bufferline.nvim", enabled = false },

  -- Ghost floating filename, top-right corner
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    opts = {
      window = {
        placement = { vertical = "top", horizontal = "right" },
        margin = { vertical = 1, horizontal = 2 },
      },
      highlight = {
        groups = {
          InclineNormal   = { guibg = "none", guifg = "#3d3d3d" },
          InclineNormalNC = { guibg = "none", guifg = "#2a2a2a" },
        },
      },
      render = function(props)
        local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if name == "" then name = "[no name]" end
        local modified = vim.bo[props.buf].modified and " ●" or ""
        return { { name .. modified } }
      end,
    },
  },
}
