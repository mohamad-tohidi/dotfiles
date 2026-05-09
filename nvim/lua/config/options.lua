-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Shift code right (gap between line numbers and code)
-- Left margin (gap between screen edge and line number)
-- Right padding (gap between line number and code)
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "no"   -- no sign column clutter
vim.opt.laststatus = 0
vim.opt.showtabline = 0
-- statuscolumn: [2 spaces][line number][4 spaces]
vim.opt.statuscolumn = "       %=%l     "
