local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local gears = require("gears")

local HOME = os.getenv("HOME")


local battery_widget = {}


local function worker(args) 
    local args  = args or  {}
    local height =  args.height or 7
    height = 10 - height -- for some reason 10 is acting as a magical number
    local width = args.width or 10
    local gaps = 10
    local bg_color = args.bg_color or "#ffffff"
    local text_margin = args.text_margin or 2
    
    

    local text = wibox.widget.textbox()



    local notification
    local function show_battery_status()
       awful.spawn.easy_async([[bash -c 'acpi -i']],
           function(stdout, _, _, _)
               notification = naughty.notify{
                   text =  stdout,
                   title = "Battery status",
                   timeout = 5, hover_timeout = 0.5,
                   width = 200,
               }
           end
       )
    end

       local progress_bar =  wibox.widget {
        max_value     = 1,
        value = 0.1, 
        forced_width  = width,
        clip = true, 
        shape = gears.shape.bar, 
        margins = {
            top = RC.vars.top_wibox_height/2 + height - gaps  , 
            bottom = RC.vars.top_wibox_height/2 + height - gaps,    

        }, 

        color  = "#ffffff", 
        background_color = "#28334a", 
        widget        = wibox.widget.progressbar,
    }
    

    local battery_icons = wibox.widget {
        {
            id = "icon" , 

                --image = beautiful.lightning_bolt, 
                widget = wibox.widget.imagebox, 
                resize = false,
        }
        , 

        margins = {
            top = 5,

        }, 
            
        widget = wibox.container.margin

        }


    battery_widget = wibox.widget {
        battery_icons, 
        --progress_bar, 

        {

            margins = 1,
            widget = wibox.container.margin
        }, 
        {
            id = "progress_bar", 
            {
                id = "battery", 
                max_value     = 1,
                value         = 0.33,
                background_color = bg_color, 
                margins = {
                left = RC.vars.top_wibox_height/2 + height - gaps  , 
                right = RC.vars.top_wibox_height/2 + height - gaps,    
                }, 
                 
                widget        = wibox.widget.progressbar,
            },
        forced_width  = width,
        direction     = 'east',
        layout        = wibox.container.rotate,
        }, 

        {

            margins = text_margin,
            widget = wibox.container.margin
        }, 
    text , 
    layout = wibox.layout.fixed.horizontal
    --layout = wibox.layout.stack
    }
    local function show_battery_warning()
    naughty.notify{
        icon = HOME .. "/.config/awesome/nichosi.png",
        icon_size=100,
        text = "Huston, we have a problem",
        title = "Battery is dying",
        timeout = 5, hover_timeout = 0.5,
        position = "top_right",
        bg = "#F06060",
        fg = "#EEE9EF",
        width = 300,
    }
end


watch("acpi", 5,
    function(widget, stdout, stderr, exitreason, exitcode)
        local battery_color
        local batteryType
       local _, status, charge_str, time = string.match(stdout, '(.+): (%a+), (%d?%d%d)%%,? ?.*')
        local charge = tonumber(charge_str)
        if (charge >= 0 and charge < 15) then
            battery_color = "#ff0000"
            if status ~= 'Charging' then
                show_battery_warning()
            end
        elseif (charge >= 15 and charge < 40) then 
            battery_color = "#ff2e62"
        elseif (charge >= 40 and charge < 60) then 

            battery_color = "#f38081"
        elseif (charge >= 60 and charge < 80) then 
            battery_color = "#4545ab"
        elseif (charge >= 80 and charge <= 100) then 
            battery_color = "#00adb5"
        end
        if status == 'Charging' then
            battery_icons.icon:set_image(beautiful.lightning_bolt)
        else
            if status == 'Full' then 
                battery_icons.icon:set_image(beautiful.lightning_bolt)
            else
                battery_icons.icon:set_image('')
            end
        end



        --progress_bar:set_value(charge / 100)
        --progress_bar.color = battery_color
        text.text = charge .. "%"
        widget.progress_bar.battery:set_value(charge / 100)
        widget.progress_bar.battery:set_color(battery_color)

    end,
    battery_widget)
    battery_widget:connect_signal("mouse::enter", function() show_battery_status() end)
    battery_widget:connect_signal("mouse::leave", function() naughty.destroy(notification) end)


    return battery_widget
end

return setmetatable(battery_widget, { __call = function(_, ...)
    return worker(...)
end })
    

