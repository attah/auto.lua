#!/usr/bin/env lua

require "ubus"
require "uloop"

local conn = ubus.connect()
if not conn then
  error("Failed to connect to ubusd")
end

function event_wrapper(event_name, data)
  ok, event = pcall(require, "event." .. event_name)
  if not ok then
    print("failed to load module for " .. event_name)
    return
  end
  if not pcall(event.handle, data) then
    print("failed to execute handler for " .. event_name)
    return
  end
end

-- TODO: auto-populate with available listeners
local listener = {
  new_station = function(msg)
    event_wrapper("new_station", msg)
  end,
  ['5m_tick'] = function(msg)
    event_wrapper("5m_tick", msg)
  end,
  other_event = function(msg)
    print("other")
  end,
}

conn:listen(listener)
uloop.run()

conn:close()
