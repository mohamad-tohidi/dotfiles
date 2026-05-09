return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ty = {},
        pyright = {
          enabled = false,
        },
      },
    },
  },

  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    ft = "python",
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select venv" },
    },
    opts = {
      search = {
        uv = {
          command = "fd python$ .venv/bin --full-path --color never",
        },
      },
      options = {
        enable_cached_venvs = true,
        cached_venv_automatic_activation = true,
      },
    },
    config = function(_, opts)
      require("venv-selector").setup(opts)
    end,
  },
}
