local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local beautiful = require("beautiful")


local M = {} -- menu
local _M = {} -- module

local terminal = RC.vars.terminal
local editor = os.getenv("EDITOR") or "nano"
local editor_cmd = terminal .. " -e " .. editor


M.awesome = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "Shutdown / logout" , "oblogout" }  , 
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}
M.favorite = {
  { "caja", "caja" },
  { "thunar", "thunar" },
  { "geany", "geany" },
  { "clementine", "clementine" },
  { "firefox", "firefox", awful.util.getdir("config") .. "/firefox.png" },
  { "chromium", "chromium" },
  { "&firefox", "firefox" },
  { "&thunderbird", "thunderbird" },
  { "libreoffice", "libreoffice" },
  { "transmission", "transmission-gtk" },
  { "gimp", "gimp" },
  { "inkscape", "inkscape" },
  { "screenshooter", "xfce4-screenshooter" }
}

M.network_main = {
  { "wicd-curses", "wicd-curses" },
  { "wicd-gtk", "wicd-gtk" }
}

function _M.get()
    local menu_items = {
        {"awesome" , M.awesome , beautiful.awesome_subicon },
        { "open terminal" , terminal },
        { "network" , M.network_main}, 
        { "favorite" , M.favorite}, 
    }
    return menu_items
end


return setmetatable(
    {},
    {__call = function(_, ...) return _M.get(...) end }

)
