vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps

keymap.set("i", "jk", "<ESC>") -- exit insert mode

keymap.set("n", "<leader>nh", ":nohl<CR>") -- delete searchterm

keymap.set("n", "x", "_x") -- delete character without copying it

keymap.set("n", "<leader>+", "<C-a>") -- increment number
keymap.set("n", "<leader>-", "<C-x>") -- decrement number

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make splits equal
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

keymap.set("n", "<leader>rn", "vim.lsp.buf.rename()<CR>") -- rename word under cursor

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope oldfiles<cr>")
keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>")

-- toggleterm
keymap.set("n", "<leader>j", "<cmd>ToggleTerm size=15 direction=horizontal<cr>")

-- copilot
keymap.set("i", "cpp", ":Copilot")
