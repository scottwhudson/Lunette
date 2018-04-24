local obj = {}
obj.__index = obj

obj.history = {}

function obj:init()
  return obj
end

function obj:count()
  local count = 0

  for _ in pairs(obj.history) do
    count = count + 1
  end

  return count
end

function obj:push(prevState, nextState)
  local event = {}
  event["prev"] = prevState
  event["next"] = nextState

  table.insert(obj.history, 1, event)
end

function obj:pop()
  local event = obj.history[1]
  table.remove(obj.history, 1)

  return event.prev
end

function printLog()
  for k, v in pairs(obj.history) do
    print(k)
  end
end


return obj
