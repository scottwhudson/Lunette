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
    --print(k.." "..v)
  end

  return count
end

function obj:push(prevState, nextState)
  print("push called")

  print("prevState")
  for k, v in pairs(prevState) do
    print(k.." "..v)
  end

  print("nextState")
  for k, v in pairs(nextState) do
    print(k.." "..v)
  end

  local event = {}
  event["prev"] = prevState
  event["next"] = nextState

  table.insert(obj.history, 1, event)
end

function obj:pop()
  print("pop called")
  local event = obj.history[1]

  print("prevState")
  for k, v in pairs(event.prev) do
    print(k.." "..v)
  end

  print("nextState")
  for k, v in pairs(event.next) do
    print(k.." "..v)
  end
  table.remove(obj.history, 1)

  return event.prev
end

function printLog()
  for k, v in pairs(obj.history) do
    print(k)
  end
end


return obj
