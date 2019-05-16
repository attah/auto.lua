local config = {}
local dynamic = require "config.dynamic"
local user = require "config.user"
local hp = require "helper.hostapd_presence"

config.actions = {
    function()
      if hp.is_present(user.phone_mac) then
        dynamic.me_gone = 0
      else
        dynamic.me_gone = dynamic.me_gone + 1
      end
    end,
}

return config
