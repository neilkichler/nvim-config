local colors = require("fluorite.utils").colors
local styles = require("fluorite.utils").styles
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                                    json                                     --
---------------------------------------------------------------------------------
Group.new("jsonKeyword", colors.yellow, nil, nil)
Group.new("jsonEscape", colors.yellow, nil, nil)
Group.new("jsonNull", colors.dark_pink, nil, styles.italic)
Group.new("jsonBoolean", colors.dark_pink, nil, styles.italic)
