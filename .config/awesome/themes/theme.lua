---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local colors = RC.vars.colors
local themes_path = "/home/sujan/".. ".config/awesome/themes/fantasy/"
local icons = themes_path .. "icons/"
local theme = {}

theme.font          = "vt323 10"
theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

--theme.lightning_bolt = icons .. "svg/15/lightning-bolt.svg"
--theme.volume_up = icons .. "png10/volume-up.png"
--theme.volume_muted = icons .. "svg/15/volume-muted-fill.svg"

theme.lightning_bolt = icons .. "svg/10/lightning-bolt.svg"
theme.volume_up = icons .. "svg/1o/volume-up.svg"
theme.volume_muted = icons .. "svg/10/volume-muted.svg"
--
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.taglist_fg_focus    = colors.five_shades_of_grey[1]
theme.taglist_fg_occupied = colors.android_lollipop[2]
theme.taglist_fg_urgent   = "#f00000"
theme.taglist_fg_empty    = colors.blue[3]
theme.taglist_spacing     = 4
theme.taglist_font = "awesomewm-font 10"
theme.notification_font = "Fira Code 8"
-- Generate taglist squares:
--local taglist_square_size = dpi(4)
--theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    --taglist_square_size, theme.fg_normal
--)
--theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    --taglist_square_size, theme.fg_normal
--)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.svg"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.svg"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.svg"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.svg"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.svg"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.svg"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.svg"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.svg"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.svg"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.svg"

theme.wallpaper = themes_path.."default/background.svg"

-- You can use your own layout icons like this:
--theme.layout_fairh = themes_path.."layouts/fairhw.svg"
--theme.layout_fairv = themes_path.."layouts/fairvw.svg"
--theme.layout_floating  = themes_path.."layouts/floatingw.svg"
--theme.layout_magnifier = themes_path.."layouts/magnifierw.svg"
--theme.layout_max = themes_path.."layouts/maxw.svg"
--theme.layout_fullscreen = themes_path.."layouts/fullscreenw.svg"
--theme.layout_tilebottom = themes_path.."layouts/tilebottomw.svg"
--theme.layout_tileleft   = themes_path.."layouts/tileleftw.svg"
--theme.layout_tile = themes_path.."layouts/tile.svg"
--theme.layout_tiletop = themes_path.."layouts/tiletopw.svg"
--theme.layout_spiral  = themes_path.."layouts/spiralw.svg"
--theme.layout_dwindle = themes_path.."layouts/dwindlew.svg"
--theme.layout_cornernw = themes_path.."layouts/cornernww.svg"
--theme.layout_cornerne = themes_path.."layouts/cornernew.svg"
--theme.layout_cornersw = themes_path.."layouts/cornersww.svg"
--theme.layout_cornerse = themes_path.."layouts/cornersew.svg"

theme.layout_fairh =  themes_path .. "layouts/fair-h.svg"
theme.layout_fairv =  themes_path .. "layouts/fair-v.svg"
theme.layout_floating  = themes_path .. "layouts/floating.svg"
theme.layout_magnifier = themes_path .. "layouts/magnifier.svg"
theme.layout_max = themes_path .."layouts/max.svg"
theme.layout_fullscreen = themes_path .."layouts/fullscreen.svg"
theme.layout_tilebottom = themes_path .."layouts/tile-bottom.svg"
theme.layout_tileleft   = themes_path.."layouts/tile-left.svg"
theme.layout_tile = themes_path.."layouts/tile.svg"
theme.layout_tiletop = themes_path.."layouts/tile-top.svg"
theme.layout_spiral  = themes_path.."layouts/spiral.svg"
theme.layout_dwindle = themes_path.."layouts/dwindle.svg"
theme.layout_cornernw = themes_path.."layouts/corner-nw.svg"
theme.layout_cornerne = themes_path.."layouts/corner-ne.svg"
theme.layout_cornersw = themes_path.."layouts/corner-sw.svg"
theme.layout_cornerse = themes_path.."layouts/corner-se.svg"
-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
