-- Tell ty where the venv is (reads VIRTUAL_ENV or finds .venv automatically)
vim.lsp.config('ty', {
  settings = {
    ty = {
      -- ty auto-detects .venv in project root, no extra config needed for uv
    },
  },
})

-- Enable ty LSP (required for nvim >= 0.11)
vim.lsp.enable('ty')

return {
  -- Disable pyright, use ty instead
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright      = { enabled = false },
        basedpyright = { enabled = false },
      },
    },
  },

  -- Auto-activate uv venv
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = "python",
    keys = { { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select venv" } },
    opts = {
      settings = {
        search = {
          uv = {
            command = "fd python$ .venv/bin --full-path --color never",
          },
        },
      },
    },
    config = function(_, opts)
      require("venv-selector").setup(opts)
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.py",
        callback = function()
          require("venv-selector").retrieve_from_cache()
        end,
      })
    end,
  },
}
