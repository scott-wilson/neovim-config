if vim.g.project_profiles ~= nil then
  vim.g.project_profiles = {}
end

if vim.g.format_on_save ~= nil then
  vim.g.format = false
end

local function has_value(arr, val)
  if arr == nil then
    return false
  end

  for index, value in ipairs(arr) do
    if value == val then
      return true
    end
  end

  return false
end

local function load_python_profile()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  require("mason").setup()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup { ensure_installed = { "pyright", "ruff" } }
  vim.lsp.config("pyright", { capabilities = capabilities })

  require("neotest").setup({ adapters = { require "neotest-python" } })
end

local function load_rust_profile()
  require("mason").setup()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup { ensure_installed = {} }
end

local function load_c_cpp_profile()
  require("mason").setup()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup { ensure_installed = { "clangd", "clang-format", "cmake", "cmakelang" } }

  require("cmake-tools").setup {
    cmake_build_directory = function()
      return "out/${variant:buildType}"
    end
  }
end

local function load_typescript_profile()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "ts_ls",
      "eslint",
      "html",
      "cssls",
    }
  })
end

local function format_on_save()
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      local mode = vim.api.nvim_get_mode().mode

      if vim.bo.modified == true and mode == 'n' then
        vim.cmd('lua vim.lsp.buf.format()')
      end
    end
  })
end

function load_profile()
  require("mason").setup()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup { ensure_installed = { "lua_ls", "tombi", "yamlls" } }

  if has_value(vim.g.project_profiles, "python") then
    load_python_profile()
  end
  if has_value(vim.g.project_profiles, "rust") then
    load_rust_profile()
  end
  if has_value(vim.g.project_profiles, "c") or has_value(vim.g.project_profiles, "cpp") then
    load_c_cpp_profile()
  end
  if has_value(vim.g.project_profiles, "typescript") then
    load_typescript_profile()
  end

  if vim.g.format_on_save == true then
    format_on_save()
  end
end
