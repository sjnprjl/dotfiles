
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local gears = require("gears")
local colors = RC.vars.colors

local HOME = os.getenv("HOME")

local get_volume = "amixer sget Master"

local volume_widget = {}


local function worker(args) 
    local args  = args or  {}
    local height =  args.height or 0.5
    height = 10 - height -- for some reason 10 is acting as a magical number
    local width = args.width or 100
   
    local gaps = 10
    local bg_color = args.bg_color or colors.blue[2]
    local fg_color = args.fg_color or colors.white[2]
    local mute_color = args.mute_color or colors.shades_of_grey[1]
    local text_margin = args.text_margin or 2
    local icon_margin = args.text_margin or 2

    local text = wibox.widget.textbox()

   local progress_bar =  wibox.widget {
        max_value     = 1,
        value = 0.5, 
        forced_width  = width,
        clip = true, 
        shape = gears.shape.bar, 
        margins = {
            top = RC.vars.top_wibox_height/2 + height - gaps  , 
            bottom = RC.vars.top_wibox_height/2 + height - gaps,    

        }, 

        color  = fg_color, 
        background_color = bg_color, 
        widget        = wibox.widget.progressbar,
    }
    

    local volume_icon = wibox.widget {
        {
            id = "icon" , 

                --image = beautiful.volume_up, 
                widget = wibox.widget.imagebox, 
                resize = false,
        }
        , 

        margins = {
            top = 5,

        }, 
            
        widget = wibox.container.margin

        }


    volume_widget = wibox.widget {
        volume_icon, 

        {

            margins = icon_margin,
            widget = wibox.container.margin
        }, 
        progress_bar, 
        {

            margins = text_margin,
            widget = wibox.container.margin
        }, 
    text , 
    layout = wibox.layout.fixed.horizontal
    --layout = wibox.layout.stack
    }
    
    watch(get_volume , 1 , 
        function(widget , stdout , _, _, _) 
            local mute = string.match(stdout, "%[(o%D%D?)%]")
            local volume =  string.match(stdout , "(%d?%d?%d)%%")
            local volume_up = "/home/sujan/.config/awesome/themes/fantasy/icons/png10/volume-up.png"

            local volume_mute = "/home/sujan/.config/awesome/themes/fantasy/icons/png10/volume-muted.png"
            volume = tonumber(volume)
            

            if mute == "off" then 
                progress_bar.color = mute_color
                volume_icon.icon:set_image(volume_up)
            else 
                volume_icon.icon:set_image(volume_mute)
                progress_bar.color = fg_color
            end
            progress_bar.value = volume / 100
            text.text = volume .. "%"

        end , volume_widget)
    return volume_widget
end


return setmetatable(volume_widget, { __call = function(_, ...)
    return worker(...)
end })
    

