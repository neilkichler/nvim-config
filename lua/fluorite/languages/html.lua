local colors = require("fluorite.utils").colors
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                                    html                                     --
---------------------------------------------------------------------------------
Group.new("htmlTag", colors.white, nil, nil)
Group.new("htmlTagName", colors.light_blue, nil, nil)
Group.new("htmlArg", colors.yellow, nil, nil)
Group.new("htmlEndTag", colors.white, nil, nil)
Group.new("htmlSpecialTagName", colors.light_blue, nil, nil)
