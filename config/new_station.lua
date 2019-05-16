local config = {}
local user_config = require "config.user"
local dynamic = require "config.dynamic"

config[user_config.phone_mac] =
    function()
      print("it's a me lua-igi!")
      local hue = require "action.hue"
      if dynamic.me_gone > 3 then
        hue.set_group_bri(1, 222)
      end
    end
config[user_config.chromecast_mac]=
    function()
      local hue = require "action.hue"
      if hue.get_group_bri(2) > 100 then
        print("it's a me lua-igi 2.0!")
        hue.set_group_bri(2, 100)
      end
    end


return config
