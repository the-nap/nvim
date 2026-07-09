return {
  "quarto-dev/quarto-nvim",
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function ()
    require("quarto").setup({
      lspFeatures = { 
        languages = { "python" },
        diagnostict = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        hover = "H",
        definition = "gd",
        rename = "<leader>rn",
        references = "gr",
        format = "<leader>gf",
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    })
  end
}
