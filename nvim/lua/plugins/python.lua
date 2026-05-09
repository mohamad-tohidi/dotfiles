return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ty = {},       -- ty language server (astral type checker)
        pyright = { enabled = false },  -- disable pyright, use ty instead
      },
    },
  },

  -- Auto-activate uv venv
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        search = {
          -- find .venv created by uv
          uv = {
            command = "fd python$ .venv/bin --full-path --color never",
          },
        },
      },
    },
    -- auto-select on open
    ft = "python",
    keys = { { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select venv" } },
    config = function(_, opts)
      require("venv-selector").setup(opts)
      -- auto-activate on BufEnter for python files
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.py",
        callback = function()
          require("venv-selector").retrieve_from_cache()
        end,
      })
    end,
  },
}
