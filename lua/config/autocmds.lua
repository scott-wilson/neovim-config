-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Quint support
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "quint",
  callback = function(ev)
    vim.lsp.start({ name = "quint", cmd = { "quint-language-server", "--stdio" }, root_dir = vim.fs.dirname() })
  end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.qnt",
  callback = function(ev)
    vim.bo.filetype = "quint"
  end,
})
vim.filetype.add({ pattern = {
  ["*.qnt"] = "quint",
} })
