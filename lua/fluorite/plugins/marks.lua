local colors = require("fluorite.utils").colors
local Group = require("fluorite.utils").Group
local styles = require("fluorite.utils").styles

---------------------------------------------------------------------------------
--                                     marks                                   --
---------------------------------------------------------------------------------
Group.new("MarkSignHL", colors.dark_pink, nil, styles.italic)
Group.new("MarkSignNumHL", colors.light_blue, nil, nil)
Group.new("MarkVirtTextHL", colors.light_grey:dark(), nil, nil)
