if vim.g.project_profiles ~= nil then
  vim.g.project_profiles = {}
end

if vim.g.format_on_save ~= nil then
  vim.g.format = false
end

local function has_value(arr, val)
  for index, value in ipairs(arr) do
    if value == val then
      return true
    end
  end

  return false
end

local function load_python_profile()

end

local function load_rust_profile()
  vim.keymap.set("n", "<leader>a", function()
    -- Supports rust-analyzer's grouping or vim.lsp.buf.codeAction() if you don't want grouping.
    vim.cmd.RustLsp("codeAction")
  end, { silent = true, buffer = bufnr })
  vim.keymap.set("n", "K", function()
    vim.cmd.RustLsp({ "hover", "actions" })
  end, { silent = true, buffer = bufnr })
end

local function format_on_save()
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      local mode = vim.api.nvim_get_mode().mode
      local filetype = vim.bo.filetype

      if vim.bo.modified == true and mode == 'n' then
        vim.cmd('lua vim.lsp.buf.format()')
      end
    end
  })
end

function load_profile()
  if has_value(vim.g.project_profiles, "python") then
    load_python_profile()
  end
  if has_value(vim.g.project_profiles, "rust") then
    load_rust_profile()
  end

  if vim.g.format_on_save == true then
    format_on_save()
  end
end
