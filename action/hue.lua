#!/usr/bin/env lua

local curl = require "helper.curl"
local json = require "lib.json"
local config = require "config.hue"

local action = {}

function action.group_action(group_id, data)
  curl.put(config.addr.."/api/"..config.user.."/groups/"..tostring(group_id).."/action", data)
end

function action.group_query(group_id, addr)
  local res = curl.get(config.addr.."/api/"..config.user.."/groups/"..tostring(group_id))
  local jres = json.decode(res)
  for k,v in pairs(addr) do
    jres=jres[v]
  end
  return jres
end

function action.get_group_bri(group_id)
  act = action.group_query(group_id, {"action"})
  if act.on == false then
    return 0
  else
    return act.bri
  end
end

function action.set_group_bri(group_id, bri)
  action.group_action(group_id, json.encode({on=true, bri=bri}))
end

return action
