local keymap = vim.keymap.set

-- Space as leader
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Window resize
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Open explorer on left
keymap("n", "<leader>e", ":Lex 15<cr>")

-- Navigate buffer
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Indent while on visual mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move visually selected block and respect indentation
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor inplace using J
keymap("n", "J", "mzJ`z")

-- Keep cursor in the middle
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Keep pasting buffer when yanking over visually selected
keymap("x", "p", "\"_dP")

-- Yank to system copyboard
keymap("n", "<leader>y", "\"+y")
keymap("v", "<leader>y", "\"+y")
keymap("n", "<leader>Y", "\"+Y")

-- Substitute current word in the whole file
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
