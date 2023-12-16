return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local tel_builtin = require("telescope.builtin")
    vim.keymap.set('n', '<C-p>', tel_builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', tel_builtin.live_grep, {})
  end
}
