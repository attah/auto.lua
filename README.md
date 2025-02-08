# auto.lua #
## Tiny home automation framework in Lua, for use on OpenWrt routers ##

You probably need to install:
```
lua
libubus-lua
libubox-lua
curl
```

If it isn't there already, this goes in your Scheduled Tasks:
```
*/5 * * * * /bin/ubus send 5m_tick
```

This goes in your startup:
```
/path/to/auto.lua/new_station_events.sh&
LUA_PATH='/path/to/auto.lua/?.lua' lua /path/to/auto.lua/auto.lua &
```
