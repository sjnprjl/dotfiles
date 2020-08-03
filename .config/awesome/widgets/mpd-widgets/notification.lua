local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local gears = require("gears")
local helpers = require("helpers")

local colors = RC.vars.colors
local HOME = os.getenv("HOME")

local command = "mpc idle"

local player_widget = {}



local function worker(args) 

local notification 
local function show_current_playing(title)
    --awful.spawn.easy_async([[bash -i 'mpc --format \'%title% \n %artist% \' current']] , 
    awful.spawn.easy_async([[bash -c "mpc --format ' ~> %title%  %s -> %artist%' current"]] , 
    --awful.spawn.easy_async([[bash -c "mpc idleloop"]] , 
    function(stdout , _, _, _) 
        naughty.destroy(notification)
       notification = naughty.notify{
           text = string.format(stdout , "\n"), 
           title = string.format("\n %s\n" , title), 
           timeout = 5, hover_timeout = 0.5,
           bg = colors.white[4], 
           fg = colors.black, 
           width = 300, 
           shape = helpers.prrect(10 , true , false , true , false),
           border_color = colors.white[4]
       }
    end)
end

   


function trim12(s)
   local from = s:match"^%s*()"
   return from > #s and "" or s:match(".*%S", from)
end

watch(command , 1 / 3 , 
    function(widget, stdout, stderr, exitreason, exitcode)
        local command = trim12(stdout)
        awful.spawn.easy_async([[bash -c "mpc"]] , 
        function(stdout , _, _, _) 
            if command == "player" then 
                show_current_playing("   Now Playing")
            end
            if command == "mixer" then 
                volume_state = true 
            end
            --local output = string.gsub(stdout , "[^\r\n]+")

            --stdout = stdout:gsub("\n", "---")
            lines = {}
            for s in stdout:gmatch("[^\r\n]+") do
                table.insert(lines, s)
            end
            local playing_status = lines[2] 
            playing_status = string.match(playing_status , "%[(%a+)%]")
            if playing_status == "paused" then 
                show_current_playing("   paused")
            end
        end)
end) 

return player_widget
end

return setmetatable(player_widget, { __call = function(_, ...)
    return worker(...)
end })
