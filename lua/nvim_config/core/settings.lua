-- disable netrw plug in for file exploration
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
-- Enable line and relative number
vim.wo.number = true
vim.wo.relativenumber = true

-- Indentation
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Cursor settings
vim.o.scrolloff = 8

-- Clipboard lets nvim share the clipboard outside the terminal
vim.o.clipboard = "unnamedplus"

-- General
vim.o.autoread = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.hlsearch = true

vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.o.hlsearch = true -- Highlight search results
vim.o.showtabline = 2 -- Always show tabs
vim.o.undofile = true -- Save undo history
vim.o.modifiable = true -- Allow changing of buffer