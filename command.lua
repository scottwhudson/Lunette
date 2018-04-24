local obj = {}
obj.__index = obj
obj.name = "Command"

local function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)")
end
obj.spoonPath = script_path()

Validator = dofile(obj.spoonPath.."/validator.lua")
Resize = dofile(obj.spoonPath.."/resize.lua")

function obj:leftHalf(windowFrame, screenFrame)
  local newFrame

  if Validator:leftHalf(windowFrame, screenFrame) then
    newFrame = Resize:leftThird(windowFrame, screenFrame)
  elseif Validator:leftThird(windowFrame, screenFrame) then
    newFrame = Resize:leftTwoThirds(windowFrame, screenFrame)
  else
    newFrame = Resize:leftHalf(windowFrame, screenFrame)
  end

  return newFrame
end

function obj:fullscreen(windowFrame, screenFrame)
  local newFrame = Resize:full(windowFrame, screenFrame)
  return newFrame
end

function obj:center(windowFrame, screenFrame)
  local newFrame = Resize:center(windowFrame, screenFrame)
  return newFrame
end

function obj:topHalf(windowFrame, screenFrame)
  local newFrame

  if Validator:topHalf(windowFrame, screenFrame) then
    newFrame = Resize:topThird(windowFrame, screenFrame)
  elseif Validator:topThird(windowFrame, screenFrame) then
    newFrame = Resize:topTwoThirds(windowFrame, screenFrame)
  else
    newFrame = Resize:topHalf(windowFrame, screenFrame)
  end

  return newFrame
end

function obj:bottomHalf(windowFrame, screenFrame)
  local newFrame

  if Validator:bottomHalf(windowFrame, screenFrame) then
    newFrame = Resize:bottomThird(windowFrame, screenFrame)
  elseif Validator:bottomThird(windowFrame, screenFrame) then
    newFrame = Resize:bottomTwoThirds(windowFrame, screenFrame)
  else
    newFrame = Resize:bottomHalf(windowFrame, screenFrame)
  end

  return newFrame
end

function obj:bottomLeft(windowFrame, screenFrame)
  print("foo")
end

function obj:topLeft(windowFrame, screenFrame)
  local newFrame = Resize:topLeftCorner(windowFrame, screenFrame)


  return newFrame
end

function obj:bottomRight(windowFrame, screenFrame)
end

function obj:bottomLeft(windowFrame, screenFrame)
end

function obj:rightHalf(windowFrame, screenFrame)
  local newFrame

  if Validator:rightHalf(windowFrame, screenFrame) then
    newFrame = Resize:rightThird(windowFrame, screenFrame)
  elseif Validator:rightThird(windowFrame, screenFrame) then
    newFrame = Resize:rightTwoThirds(windowFrame, screenFrame)
  else
    newFrame = Resize:rightHalf(windowFrame, screenFrame)
  end

  return newFrame
end

function obj:enlarge(windowFrame, screenFrame)
  local newFrame = Resize:enlarge(windowFrame, screen)
  return newFrame
end

function obj:shrink(windowFrame, screenFrame)
  local newFrame = Resize:shrink(windowFrame, screen)
  return newFrame
end

function obj:nextThird(windowFrame, screenFrame)
  local newFrame

  if Validator:leftThird(windowFrame, screenFrame) then
    newFrame = Resize:centerVerticalThird(windowFrame, screenFrame)
  elseif Validator:centerVerticalThird(windowFrame, screenFrame) then
    newFrame = Resize:rightThird(windowFrame, screenFrame)
  elseif Validator:rightThird(windowFrame, screenFrame) then
    newFrame = Resize:topThird(windowFrame, screenFrame)
  elseif Validator:topThird(windowFrame, screenFrame) then
    newFrame = Resize:centerHorizontalThird(windowFrame, screenFrame)
  elseif Validator:centerHorizontalThird(windowFrame, screenFrame) then
    newFrame = Resize:bottomThird(windowFrame, screenFrame)
  else
    newFrame = Resize:leftThird(windowFrame, screenFrame)
  end

  return newFrame
end

function obj:prevThird(windowFrame, screenFrame)
  local newFrame

  if Validator:leftThird(windowFrame, screenFrame) then
    newFrame = Resize:bottomThird(windowFrame, screenFrame)
  elseif Validator:bottomThird(windowFrame, screenFrame) then
    newFrame = Resize:centerHorizontalThird(windowFrame, screenFrame)
  elseif Validator:centerHorizontalThird(windowFrame, screenFrame) then
    newFrame = Resize:topThird(windowFrame, screenFrame)
  elseif Validator:topThird(windowFrame, screenFrame) then
    newFrame = Resize:rightThird(windowFrame, screenFrame)
  elseif Validator:rightThird(windowFrame, screenFrame) then
    newFrame = Resize:centerVerticalThird(windowFrame, screenFrame)
  else
    newFrame = Resize:leftThird(windowFrame, screenFrame)
  end

  return newFrame
end

function obj:nextScreen(windowFrame, screenFrame)
end

return obj
