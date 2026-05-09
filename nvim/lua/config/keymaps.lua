-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Open buffer list with <leader>b
vim.keymap.set("n", "<leader>b",
  "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
  { desc = "Buffer list" }
)
