local opts = { noremap = true, silent = true } -- No weird remaps
local term_opts = { silent = true } -- If a command outputs to the terminal it will not be echoed.

-- Shorten function name
local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts) -- The spacebar is mapped to do nothing.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Vertical split
keymap("n", "<Leader>v", ":vsplit<CR>", opts)
keymap("n", "<Esc>", [[<Cmd>noh<CR><Esc>]], opts)

keymap("v", "p", '"_dP', opts) -- Paste without copying the text you're replacing

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)