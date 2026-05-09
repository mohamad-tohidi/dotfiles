return {
  {
    "SalahDevp/scratch.nvim",
    cmd = "Scratch",
    keys = {
      {
        "<leader>S",
        function()
          -- open as float
          vim.cmd("Scratch buf python")
        end,
        desc = "Scratchpad (python)",
      },
    },
  },
}
