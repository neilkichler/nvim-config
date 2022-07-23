local colors = require("fluorite.utils").colors
local Group = require("fluorite.utils").Group
local styles = require("fluorite.utils").styles

---------------------------------------------------------------------------------
--                                 fidget.nvim                                 --
---------------------------------------------------------------------------------
Group.new("FidgetTitle", colors.yellow, colors.fluorite_bg, styles.bold)
Group.new("FidgetTask", colors.blue, colors.fluorite_bg, nil)
