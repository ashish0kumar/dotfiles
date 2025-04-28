---@type table
local config = {
  indent = {
    char = "|",
    highlight = "IndentBlanklineChar",
  },
  scope = {
    enabled = false,
  },
  exclude = {
    filetypes = { "help", "alpha", "dashboard", "lazy", "mason", "NvimTree" },
    buftypes = { "terminal", "nofile" },
  },
}

require("indent_blankline").setup(config)
