local awful = require("awful")

local helpers = require("helpers")

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end
--function string:split( inSplitPattern )

    --local outResults = {}
    --local theStart = 1
    --local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )

    --while theSplitStart do
        --table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
        --theStart = theSplitEnd + 1
        --theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
    --end

    --table.insert( outResults, string.sub( self, theStart ) )
    --return outResults
--end
local _M = {}

function _M.get()
    tags = {}
    awful.screen.connect_for_each_screen(function(s) 
    tags[s] = awful.tag(

            split("A W E S O M E W M" , " ")

            , s, 
            {
                RC.layouts[2],
                RC.layouts[1], 
                RC.layouts[1], 
                RC.layouts[1], 
                RC.layouts[1], 
                RC.layouts[1], 
                RC.layouts[1], 
                RC.layouts[1], 
                RC.layouts[1], 

            })
        end)
    return tags
    end
return setmetatable(
    {},
    {__call = function(_, ...) return _M.get(...) end }
)
 

