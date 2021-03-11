-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
-- Menubar library
local menubar = require("menubar")
local naughty = require("naughty")

local helpers = require("helpers")
-- Resource Configuration
local modkey = RC.vars.modkey
local altkey = RC.vars.altkey 
local shiftkey = RC.vars.shiftkey
local ctrlkey = RC.vars.ctrlkey
local terminal = RC.vars.terminal
local cycle_prev   = true 

local volume_step = RC.vars.volume_step



local _M = {}

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show helpppp", group="awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Tag browsing
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    awful.key({ modkey,           }, "w", function () RC.mainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Layout manipulation
awful.key({ modkey,           }, "Tab",
function ()
    if cycle_prev then
        awful.client.focus.history.previous()
    else
        awful.client.focus.byidx(-1)
    end
    if client.focus then
        client.focus:raise()
    end
end,
{description = "cycle with previous/go back", group = "client"}),
awful.key({ modkey, shiftkey   }, "Tab",
function ()
    if cycle_prev then
        awful.client.focus.byidx(1)
        if client.focus then
            client.focus:raise()
        end
    end
end,
{description = "go forth", group = "client"}),
--awful.key({ modkey,           }, "Tab",
    --function ()
        --awful.client.focus.history.previous()
        --if client.focus then
            --client.focus:raise()
        --end
    --end,
--{description = "go back", group = "client"}),
-- Focus client by direction (hjkl keys)
awful.key({ modkey }, "j",
function()
    awful.client.focus.bydirection("down")
end,
{description = "focus down", group = "client"}),
awful.key({ modkey}, "k",
function()
    awful.client.focus.bydirection("up")
end,
{description = "focus up", group = "client"}),
awful.key({ modkey }, "h",
function()
    awful.client.focus.bydirection("left")
end,
{description = "focus left", group = "client"}),
awful.key({ modkey }, "l",
function()
    awful.client.focus.bydirection("right")
end,
{description = "focus right", group = "client"}),
  -- Urgent or Undo:
    -- Jump to urgent client or (if there is no such client) go back
    -- to the last tag
    awful.key({ modkey,           }, "u",
        function ()
            uc = awful.client.urgent.get()
            -- If there is no urgent client, go back to last tag
            if uc == nil then
                awful.tag.history.restore()
            else
                awful.client.urgent.jumpto()
            end
        end,
        {description = "jump to urgent client", group = "client"}),


  -- Gaps
    awful.key({ modkey, shiftkey }, "minus",
        function ()
            awful.tag.incgap(5, nil)
        end,
        {description = "increment gaps size for the current tag", group = "gaps"}
    ),
    awful.key({ modkey }, "minus",
        function ()
            awful.tag.incgap(-5, nil)
        end,
        {description = "decrement gap size for the current tag", group = "gaps"}
    ),


    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "q", function ()
        awful.spawn(RC.vars.browser) end,
              {description = "open firefox browser", group = "launcher"}),
    awful.key({ modkey, ctrlkey }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, shiftkey   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Layout manipulation
    awful.key({ modkey, shiftkey   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, shiftkey   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, shiftkey   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, ctrlkey }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Resize focused client or layout factor
    awful.key({ modkey, ctrlkey }, "Down", function (c)
        helpers.resize_dwim(client.focus, "down")
    end),
    awful.key({ modkey, ctrlkey }, "Up", function (c)
        helpers.resize_dwim(client.focus, "up")
    end),
    awful.key({ modkey, ctrlkey }, "Left", function (c)
        helpers.resize_dwim(client.focus, "left")
    end),
    awful.key({ modkey, ctrlkey }, "Right", function (c)
        helpers.resize_dwim(client.focus, "right")
    end),
    awful.key({ modkey, ctrlkey }, "j", function (c)
        helpers.resize_dwim(client.focus, "down")
    end),
    awful.key({ modkey, ctrlkey }, "k", function (c)
        helpers.resize_dwim(client.focus, "up")
    end),
    awful.key({ modkey, ctrlkey }, "h", function (c)
        helpers.resize_dwim(client.focus, "left")
    end),
    awful.key({ modkey, ctrlkey }, "l", function (c)
        helpers.resize_dwim(client.focus, "right")
    end),
    --awful.key({ modkey }, function (c)
        ----helpers.mouse_resize(client.focus)
    --end),


-- Brightness
awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc " .. RC.vars.brightness_value) end,
{description = "+10%", group = "hotkeys"}),
awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec " .. RC.vars.brightness_value) end,
{description = "-10%", group = "hotkeys"}),

-- ALSA volume control
awful.key({ }, "XF86AudioRaiseVolume",
function ()
    helpers.alsa_volume(volume_step)
end,
{description = "volume up", group = "hotkeys"}),
awful.key({ }, "XF86AudioLowerVolume",
function ()
    helpers.alsa_volume(-volume_step)
end,
{description = "volume down", group = "hotkeys"}),
awful.key({ }, "XF86AudioMute",
function ()
   helpers.volume_control(0)
end),


    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Menubar
    --awful.key({ modkey }, "p", function() menubar.show() end,
              --{description = "show the menubar", group = "launcher"}) , 
    awful.key({ modkey }, "p", function() awful.spawn("rofi -combi-modi window,drun,ssh -font \"vt323 18\" -show combi") end,
              {description = "show the menubar", group = "launcher"})

  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })

