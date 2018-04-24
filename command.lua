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

  if Validator:leftHalf(windowFrame, screenFrame) then
    window = Resize:leftThird(windowFrame, screenFrame)
  elseif Validator:leftThird(windowFrame, screenFrame) then
    window = Resize:leftTwoThirds(windowFrame, screenFrame)
  else
    window = Resize:leftHalf(windowFrame, screenFrame)
  end

  return window
end

function obj:fullscreen(windowFrame, screenFrame)
  windowFrame = Resize:full(windowFrame, screenFrame)
  return windowFrame
end

function obj:center(windowFrame, screenFrame)
  windowFrame = Resize:center(windowFrame, screenFrame)
end

function obj:topHalf(windowFrame, screenFrame)
  if Validator:topHalf(windowFrame, screenFrame) then
    windowFrame = Resize:topThird(windowFrame, screenFrame)
  elseif Validator:topThird(windowFrame, screenFrame) then
    windowFrame = Resize:topTwoThirds(windowFrame, screenFrame)
  else
    windowFrame = Resize:topHalf(windowFrame, screenFrame)
  end

  return windowFrame
end

function obj:bottomHalf(windowFrame, screenFrame)
  if Validator:bottomHalf(windowFrame, screenFrame) then
    windowFrame = Resize:bottomThird(windowFrame, screenFrame)
  elseif Validator:bottomThird(windowFrame, screenFrame) then
    windowFrame = Resize:bottomTwoThirds(windowFrame, screenFrame)
  else
    windowFrame = Resize:bottomHalf(windowFrame, screenFrame)
  end

  return windowFrame
end

function obj:bottomLeft(windowFrame, screenFrame)
  print("foo")
end

function obj:topLeft(windowFrame, screenFrame)

  windowFrame = Resize:topLeftCorner(windowFrame, screenFrame)

  window:setFrame(windowFrame)
end

function obj:bottomRight(windowFrame, screenFrame)
end

function obj:bottomLeft(windowFrame, screenFrame)
end

function obj:rightHalf(windowFrame, screenFrame)
  if Validator:rightHalf(windowFrame, screenFrame) then
    windowFrame = Resize:rightThird(windowFrame, screenFrame)
  elseif Validator:rightThird(windowFrame, screenFrame) then
    windowFrame = Resize:rightTwoThirds(windowFrame, screenFrame)
  else
    windowFrame = Resize:rightHalf(windowFrame, screenFrame)
  end

  return windowFrame
end

function obj:enlarge(windowFrame, screenFrame)
  windowFrame = Resize:enlarge(windowFrame, screen)

  window:setFrame(windowFrame)
end

function obj:shrink(windowFrame, screenFrame)
  windowFrame = Resize:shrink(windowFrame, screen)

  window:setFrame(windowFrame)
end

function obj:nextThird(windowFrame, screenFrame)
  if is_left_third(windowFrame, screenFrame) then
    windowFrame = resize_center_vertical_third(windowFrame, screenFrame)
  elseif is_center_vertical_third(windowFrame, screenFrame) then
    windowFrame = resize_right_third(windowFrame, screenFrame)
  elseif is_right_third(windowFrame, screenFrame) then
    windowFrame = resize_top_third(windowFrame, screenFrame)
  elseif is_top_third(windowFrame, screenFrame) then
    windowFrame = resize_center_horizontal_third(windowFrame, screenFrame)
  elseif is_center_horizontal_third(windowFrame, screenFrame) then
    windowFrame = resize_bottom_third(windowFrame, screenFrame)
  else
    windowFrame = resize_left_third(windowFrame, screenFrame)
  end

  window:setFrame(windowFrame)
end

function obj:prevThird(windowFrame, screenFrame)
  if is_left_third(windowFrame, screenFrame) then
    windowFrame = resize_bottom_third(windowFrame, screenFrame)
  elseif is_bottom_third(windowFrame, screenFrame) then
    windowFrame = resize_center_horizontal_third(windowFrame, screenFrame)
  elseif is_center_horizontal_third(windowFrame, screenFrame) then
    windowFrame = resize_top_third(windowFrame, screenFrame)
  elseif is_top_third(windowFrame, screenFrame) then
    windowFrame = resize_right_third(windowFrame, screenFrame)
  elseif is_right_third(windowFrame, screenFrame) then
    windowFrame = resize_center_vertical_third(windowFrame, screenFrame)
  else
    windowFrame = resize_left_third(windowFrame, screenFrame)
  end

  window:setFrame(windowFrame)
end

return obj
