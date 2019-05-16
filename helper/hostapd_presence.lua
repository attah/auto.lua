#!/usr/bin/env lua

require "ubus"
local module = {}

function module.is_present(mac)
  local conn = ubus.connect()
  if not conn then
    error("Failed to connect to ubusd")
  end

  local ret = false

  for k, v in pairs(conn:objects()) do
    if string.match(v, "hostapd.wlan") then
      local res = conn:call(v, "get_clients", {})
      for k2, v2 in pairs(res.clients) do
        if k2 == mac then
          ret = true
        end
      end
    end
  end

  conn:close()
  return ret
end
return module
