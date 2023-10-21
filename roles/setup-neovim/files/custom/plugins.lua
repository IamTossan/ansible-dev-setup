local plugins = {
  {
    "NvChad/NvTerm",
    config = function()
      require("nvterm").setup({
        terminals = {
          type_opts = {
            float = {
              row = 0.1,
              col = 0.075,
              width = 0.85,
              height = 0.8,
            }
          }
        }
      })
    end,
  }
}

return plugins
