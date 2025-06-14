---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',

  statusline = {
    theme = "default"
  },

  nvdash = {
    load_on_startup = true,

    header = {
	    [[                                                    ]],
	    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	    [[                                                    ]],
    }
  },

  hl_override = {
    IndentBlanklineChar = { fg = "#1e1d2d" },
  },
}

M.plugins = "custom.plugins"

require("custom")

return M
