return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  config = function ()
    vim.keymap.set("n", "<leader>a", function ()
      -- Supports rust-analyzer's grouping or vim.lsp.buf.codeAction() if you don't want grouping.
      vim.cmd.RustLsp("codeAction")
    end, {silent = true, buffer = bufnr})
    vim.keymap.set("n", "K", function ()
      vim.cmd.RustLsp({"hover", "actions"})
    end, {silent = true, buffer=bufnr})
  end,
}
