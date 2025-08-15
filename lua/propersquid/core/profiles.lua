if vim.g.project_profiles ~= nil then
  vim.g.project_profiles = {}
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

function load_profile()
  if has_value(vim.g.project_profiles, "python") then
    load_python_profile()
  end
  if has_value(vim.g.project_profiles, "rust") then
    load_rust_profile()
  end
end
