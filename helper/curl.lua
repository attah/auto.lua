#!/usr/bin/env lua

curl = {}

function execute(cmd)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  return s
end

function curl.get(url)
  return execute("curl -s -X GET "..url)
end
function curl.put(url, body)
  return execute("curl -s -X PUT -H \"Content-Type: application/json\" -d '"..body.."' "..url)
end
function curl.post(url, body)
  return execute("curl -s -X POST -H \"Content-Type: application/json\" -d '"..body.."' "..url)
end
function curl.delete(url)
  return execute("curl -s -X DELETE "..url)
end
return curl
