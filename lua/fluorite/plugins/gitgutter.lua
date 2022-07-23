local colors = require("fluorite.utils").colors
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                                 git-gutter                                  --
---------------------------------------------------------------------------------
Group.new("GitGutterAdd", colors.green, nil, nil)
Group.new("GitGutterChange", colors.yellow, nil, nil)
Group.new("GitGutterDelete", colors.red, nil, nil)
