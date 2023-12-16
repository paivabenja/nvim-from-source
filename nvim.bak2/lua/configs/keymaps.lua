-- booooca booooooca vamo BOOOOOOCAAAAAA
vim.g.mapleader = " "

-- lsp floating diagnostics
vim.keymap.set("n", "<space>l", vim.diagnostic.open_float)

-- windows
vim.keymap.set("n", "<leader>wv", function()
	vim.cmd("vs")
end)
vim.keymap.set("n", "<leader>wh", function()
	vim.cmd("sp")
end)
vim.keymap.set("n", "<leader>wq", function()
	vim.cmd("q")
end)

-- files
vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>g", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>e", function()
	require("neo-tree.command").execute({ toggle = true, position = "current" })
end)

-- hop.nvim
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("n", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("n", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("n", "t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("n", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
vim.keymap.set("n", "<leader>f", hop.hint_char2)

-- terminal gil
vim.keymap.set({ "t", "n" }, "<C-h>", "<cmd>ToggleTerm<CR>")

-- BOOOOOOOOOOOOOOCAAAAAAAAA
vim.keymap.set({ "n", "i", "v" }, "<f1>", "")
