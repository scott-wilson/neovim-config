return {
  "voldikss/vim-floaterm",
  config = function ()
    -- FloaTerm configuration
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ", opts)
    vim.keymap.set('n', "t", ":FloatermToggle myfloat<CR>", opts)
    vim.keymap.set('t', "<Esc>", "<C-\\><C-n>:q<CR>", opts)

  end
}
