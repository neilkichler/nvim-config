local colors = require("fluorite.utils").colors
local styles = require("fluorite.utils").styles
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                                  which-key                                  --
---------------------------------------------------------------------------------
Group.new("WhichKey", colors.red, nil, nil)
Group.new("WhichKeyGroup", colors.blue, nil, styles.italic)
Group.new("WhichKeyDesc", colors.yellow, nil, nil)
Group.new("WhichKeySeparator", colors.green, nil, nil)
Group.new("WhichKeyFloat", colors.blue, nil, nil)
Group.new("WhichKeyValue", colors.cursor_hover, nil, nil)
