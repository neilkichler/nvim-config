local colors = require("fluorite.utils").colors
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                              indent-blankline                               --
---------------------------------------------------------------------------------
Group.new("IndentBlankLineChar", colors.darker_grey:light(), nil, nil)
Group.new("IndentBlankLineContextChar", colors.yellow, nil, nil)
