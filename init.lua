local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Lunette"
obj.version = "0.1"
obj.author = "Scott Hudson <scott.w.hudson@gmail.com>"
obj.license = "MIT"
obj.homepage = "" -- TODO

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

DefaultMapping = {
  leftHalf = {{"cmd", "alt"}, "left"},
  rightHalf = {{"cmd", "alt"}, "right"},
  topHalf = {{"cmd", "alt"}, "up"},
  bottomHalf = {{"cmd", "alt"}, "down"},
  topLeft = {{"ctrl", "cmd"}, "Left"},
  topRight = {{"ctrl", "cmd"}, "Right"},
  bottomLeft = {{"ctrl", "cmd", "shift"}, "Left"},
  bottomRight = {{"ctrl", "cmd", "shift"}, "Right"},
  fullscreen = {{"cmd", "alt"}, "F"},
  center = {{"cmd", "alt"}, "C"},
  nextThird = {{"ctrl", "alt"}, "Right"},
  prevThird = {{"ctrl", "alt"}, "Left"},
  enlarge = {{"ctrl", "alt", "shift"}, "Right"},
  shrink = {{"ctrl", "alt", "shift"}, "Left"},
  undo = {{"alt", "cmd"}, "Z"},
  redo = {{"alt", "cmd", "shift"}, "Z"},
  nextDisplay = {{"ctrl", "alt", "cmd"}, "Right"},
  prevDisplay = {{"ctrl", "alt", "cmd"}, "Left"}
}

function obj:bindHotkeys(userMapping)
  print("Lunette - binding hotkeys")

  local userMapping = {} or userMapping
  local mapping = DefaultMapping

  for k, v in pairs(userMapping) do
    mapping[k] = v
  end

  for k, v in pairs(mapping) do
    if mapping[k] then
      hs.hotkey.bind(v[1], v[2], function()
        exec(k)
      end)
    end
  end
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
  elseif command == "nextDisplay" then
    newFrame = Command:nextDisplay(windowFrame, screenFrame)
  elseif command == "prevDisplay" then
    newFrame = Command:prevDisplay(windowFrame, screenFrame)
  elseif command == "redo" then
    newFrame = history:retrieveNextState()
  elseif command == "undo" then
    newFrame = history:retrievePrevState()
  end

  if command ~= "undo" and command ~= "redo" then
    history:push(currentFrame, newFrame)
  end

  window:setFrame(newFrame)
end

return obj
