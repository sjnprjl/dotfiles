-- Standard awesome library
local gears = require("gears")
local awful     = require("awful")
local beautiful = require("beautiful")
local dpi           = require("beautiful.xresources").apply_dpi

-- Wibox handling library
local wibox = require("wibox")
local helpers = require("helpers")

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()
local colors = RC.vars.colors


local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  --
  --
  --WIDGET LIST
  --
  --
  --local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
  local battery_widget = require("widgets.battery-widgets.battery")
  local volume_widget = require("widgets.volume-widgets.volume")
  local player_widget = require("widgets.mpd-widgets.notification")
  --local wifi_widget = require("widgets.network-widgets.wifi")

  player_widget()

  --
  --local volumebar_widget = require("awesome-wm-widgets.volumebar-widget.volumebar")
  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s  , height = dpi(RC.vars.top_wibox_height) 
                            , bg = beautiful.bg_normal , fg=beautiful.fg_normal})

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    expand = "none" , 
    { -- Left widgets
      layout = wibox.layout.align.horizontal,
      --RC.launcher,
      --s.mypromptbox,
    },
      s.mytaglist,
    --s.mytasklist, -- Middle widget
    { -- Right widgets
      
      layout = wibox.layout.fixed.horizontal,
      volume_widget(), 
      battery_widget({

          height = 7, 

      }),
      mykeyboardlayout,
      wibox.widget.systray(),
      mytextclock,
      s.mylayoutbox,

    },
  }
end)
-- }}}

