-- {{{ Global Variable Definitions
-- moved here in module as local variable
-- }}}

local home = os.getenv("HOME")
local helpers = require("helpers")

local _M = {
  -- This is used later as the default terminal and editor to run.
  -- terminal = "xterm",
  terminal = "kitty",
  browser = "firefox-developer-edition", 
  brightness_value = 5, 
  top_wibox_height = 22, 
   
  -- Default modkey.
  -- Usually, Mod4 is the key with a logo between Control and Alt.
  -- If you do not like this or do not have such a key,
  -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
  -- However, you can use another modifier like Mod1, but it may interact with others.
  modkey = "Mod4",
  altkey = "Mod1" , 
  ctrlkey = "Control" ,
  shiftkey = "Shift" , 
  colors = {


      pink = {

          "#eee3e7" ,
          "#ead5dc",
          "#eec9d2" ,
          "#f4b6c2" ,
          "#f6abb6" ,



      }  , 

      blue = {


          "#b3cde0" ,
          "#6497b1" ,
          "#035b96" ,
          "#04396c" ,
          "#031f4b" ,



      }, 

      pastellea = helpers.split("#fe9c8f #feb2a8 #fec8c1 #fad9c1 #f9caa7" , " "), 
      android_lollipop = helpers.split("#009688 #35a79c #54b2a9 #65c3ba #83d0c9" , " "), 
      white = helpers.split("#faf0e6 #fff5ee #fdf5e6 #faf0e6 #faebd7 #f0faef" , " "),
      five_shades_of_grey = helpers.split("#eeeeee #dddddd #cccccc #bbbbbb #aaaaaa" , " "), 
      anime_skin_tones = helpers.split("#ffe9dc #fce9db #e0a899 #dfa290 #c99789" , " "), 
      shades_of_grey = helpers.split("#bebebe #cfcfc4 #bfc1c2 #a9a9a9" , " "), 
      black = "#000000", 

  }, 

  volume_step = 4, 

  -- user defined wallpaper
  wallpaper = nil,
  --wallpaper = home .. "/Pictures/your-wallpaper-here.jpg",
}

return _M

