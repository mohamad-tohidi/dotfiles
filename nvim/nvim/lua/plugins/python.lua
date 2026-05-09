vim.lsp.config("ty", {})
vim.lsp.enable("ty")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { enabled = false },
        basedpyright = { enabled = false },
      },
    },
  },

  -- uv.nvim: auto-activates uv venv, no manual autocmd needed
  {
    "benomahony/uv.nvim",
    ft = "python",
  },

  -- venv-selector: just for manual override via <leader>cv
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = "python",
    keys = { { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select venv" } },
    opts = {},
  },
}
