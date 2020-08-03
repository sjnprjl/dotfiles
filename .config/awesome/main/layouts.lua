local awful = require("awful")


local _M = {}

function _M.get()
    
    local layouts = {
        awful.layout.suit.floating, --1
        awful.layout.suit.tile, --2
        awful.layout.suit.tile.left, --3
        awful.layout.suit.tile.bottom, --4
        awful.layout.suit.tile.top, --5
        awful.layout.suit.fair, --6
        awful.layout.suit.fair.horizontal, --7
        awful.layout.suit.spiral, --8
        awful.layout.suit.spiral.dwindle, --9
        awful.layout.suit.max, --10
        awful.layout.suit.max.fullscreen, --11
        awful.layout.suit.magnifier, --12
        awful.layout.suit.corner.nw, --13
    }
    return layouts
end

return setmetatable(
    {},
    {__call = function(_, ...) return _M.get(...) end }

)

