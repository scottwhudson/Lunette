local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Lunette"
obj.version = "0.1"
obj.author = "Scott Hudson <scott.w.hudson@gmail.com>"

-- disable animation
hs.window.animationDuration = 0

-- Internal function used to find our location, so we know where to load files from
local function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)")
end
obj.spoonPath = script_path()

Command = dofile(obj.spoonPath.."/command.lua")
History = dofile(obj.spoonPath.."/history.lua")

function obj:bindHotkeys()
  hs.hotkey.bind({"cmd", "alt"}, "Left", function()
    exec("leftHalf")
  end)

  hs.hotkey.bind({"cmd", "alt"}, "Right", function()
    exec("rightHalf")
  end)

  hs.hotkey.bind({"cmd", "alt"}, "Up", function()
    exec("topHalf")
  end)

  hs.hotkey.bind({"cmd", "alt"}, "Down", function()
    exec("bottomHalf")
  end)

  hs.hotkey.bind({"ctrl", "cmd"}, "Left", function()
    exec("topLeft")
  end)

  hs.hotkey.bind({"ctrl", "cmd"}, "Right", function()
    exec("topRight")
  end)

  hs.hotkey.bind({"ctrl", "cmd", "shift"}, "Left", function()
    exec("bottomLeft")
  end)

  hs.hotkey.bind({"ctrl", "cmd", "shift"}, "Right", function()
    exec("bottomRight")
  end)

  hs.hotkey.bind({"cmd, alt"}, "F", function()
    exec("fullscreen")
  end)

  hs.hotkey.bind({"cmd, alt"}, "C", function()
    exec("center")
  end)

  hs.hotkey.bind({"ctrl", "alt"}, "Right", function()
    exec("nextThird")
  end)

  hs.hotkey.bind({"ctrl", "alt"}, "Left", function()
    exec("prevThird")
  end)

  hs.hotkey.bind({"ctrl", "alt", "shift"}, "Right", function()
    exec("enlarge")
  end)

  hs.hotkey.bind({"ctrl", "alt", "shift"}, "Left", function()
    exec("shrink")
  end)

  hs.hotkey.bind({"alt", "cmd"}, "Z", function()
    exec("undo")
  end)

  hs.hotkey.bind({"alt", "cmd", "shift"}, "Z", function()
    exec("redo")
  end)
end

history = History:init()

function exec(command)
  local window = hs.window.focusedWindow()
  local windowFrame = window:frame()
  local screen = window:screen()
  local screenFrame = screen:frame()
  local currentFrame = window:frame()
  local newFrame

  if command == "leftHalf" then
    newFrame = Command:leftHalf(windowFrame, screenFrame)
  elseif command == "rightHalf" then
    newFrame = Command:rightHalf(windowFrame, screenFrame)
  elseif command == "topHalf" then
    newFrame = Command:topHalf(windowFrame, screenFrame)
  elseif command == "bottomHalf" then
    newFrame = Command:bottomHalf(windowFrame, screenFrame)
  elseif command == "topLeft" then
    newFrame = Command:topLeft(windowFrame, screenFrame)
  elseif command == "topRight" then
    newFrame = Command:topRight(windowFrame, screenFrame)
  elseif command == "bottomLeft" then
    newFrame = Command:bottomLeft(windowFrame, screenFrame)
  elseif command == "bottomRight" then
    newFrame = Command:bottomRight(windowFrame, screenFrame)
  elseif command == "fullscreen" then
    newFrame = Command:fullscreen(windowFrame, screenFrame)
  elseif command == "center" then
    newFrame = Command:center(windowFrame, screenFrame)
  elseif command == "nextThird" then
    newFrame = Command:nextThird(windowFrame, screenFrame)
  elseif command == "prevThird" then
    newFrame = Command:prevThird(windowFrame, screenFrame)
  elseif command == "enlarge" then
    newFrame = Command:enlarge(windowFrame, screenFrame)
  elseif command == "shrink" then
    newFrame = Command:shrink(windowFrame, screenFrame)
  elseif command == "redo" then
    newFrame = Command:redo(windowFrame, screenFrame)
  elseif command == "undo" then
    print("rewind invoked")
    newFrame = history:pop()
  end

  local foo = history:count()

  print(tostring(foo))

  if command ~= "rewind" then
    history:push(currentFrame, newFrame)
  end

  window:setFrame(newFrame)

end

return obj
