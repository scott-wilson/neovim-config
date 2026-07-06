return {
  "vuki656/package-info.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("package-info").setup()

    -- Show dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>ps",
      require("package-info").show,
      { silent = true, noremap = true, desc = "Show NPM dependency versions." }
    )

    -- Hide dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>pc",
      require("package-info").hide,
      { silent = true, noremap = true, desc = "Hide NPM dependency versions." }
    )

    -- Toggle dependency versions
    vim.keymap.set(
      { "n" },
      "<LEADER>pt",
      require("package-info").toggle,
      { silent = true, noremap = true, desc = "Toggle NPM dependency versions." }
    )

    -- Update dependency on the line
    vim.keymap.set(
      { "n" },
      "<LEADER>pu",
      require("package-info").update,
      { silent = true, noremap = true, desc = "Update NPM dependency on the line." }
    )

    -- Delete dependency on the line
    vim.keymap.set(
      { "n" },
      "<LEADER>pd",
      require("package-info").delete,
      { silent = true, noremap = true, desc = "Delete NPM dependency on the line." }
    )

    -- Install a new dependency
    vim.keymap.set(
      { "n" },
      "<LEADER>pi",
      require("package-info").install,
      { silent = true, noremap = true, desc = "Install a new NPM dependency." }
    )

    -- Install a different dependency version
    vim.keymap.set(
      { "n" },
      "<LEADER>pp",
      require("package-info").change_version,
      { silent = true, noremap = true, desc = "Install a different NPM dependency version." }
    )
  end,
}
