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

--- Command:leftHalf(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
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

--- Command:fullscreen(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
function obj:fullscreen(windowFrame, screenFrame)
  local newFrame = Resize:full(windowFrame, screenFrame)
  return newFrame
end

--- Command:center(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
function obj:center(windowFrame, screenFrame)
  local newFrame = Resize:center(windowFrame, screenFrame)
  return newFrame
end

--- Command:topHalf(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
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

--- Command:bottomHalf(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
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

--- Command:topLeft(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
function obj:topLeft(windowFrame, screenFrame)
  local newFrame

  if Validator:topLeftHalf(windowFrame, screenFrame) then
    newFrame = Resize:topLeftThird(windowFrame, screenFrame)
  elseif Validator:topLeftThird(windowFrame, screenFrame) then
    newFrame = Resize:topLeftTwoThirds(windowFrame, screenFrame)
  else
    newFrame = Resize:topLeftHalf(windowFrame, screenFrame)
  end

  return newFrame
end

--- Command:topRight(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
function obj:topRight(windowFrame, screenFrame)
  local newFrame

  if Validator:topRightHalf(windowFrame, screenFrame) then
    newFrame = Resize:topRightThird(windowFrame, screenFrame)
  elseif Validator:topRightThird(windowFrame, screenFrame) then
    newFrame = Resize:topRightTwoThirds(windowFrame, screenFrame)
  else
    newFrame = Resize:topRightHalf(windowFrame, screenFrame)
  end

  return newFrame
end

--- Command:bottomRight(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
function obj:bottomRight(windowFrame, screenFrame)
  local newFrame

  if Validator:bottomRightHalf(windowFrame, screenFrame) then
    newFrame = Resize:bottomRightThird(windowFrame, screenFrame)
  elseif Validator:bottomRightThird(windowFrame, screenFrame) then
    newFrame = Resize:bottomRightTwoThirds(windowFrame, screenFrame)
  else
    newFrame = Resize:bottomRightHalf(windowFrame, screenFrame)
  end

  return newFrame
end

--- Command:bottomLeft(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
function obj:bottomLeft(windowFrame, screenFrame)
  local newFrame

  if Validator:bottomLeftHalf(windowFrame, screenFrame) then
    newFrame = Resize:bottomLeftThird(windowFrame, screenFrame)
  elseif Validator:bottomLeftThird(windowFrame, screenFrame) then
    newFrame = Resize:bottomLeftTwoThirds(windowFrame, screenFrame)
  else
    newFrame = Resize:bottomLeftHalf(windowFrame, screenFrame)
  end

  return newFrame
end

--- Command:rightHalf(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
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

--- Command:enlarge(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
function obj:enlarge(windowFrame, screenFrame)
  local newFrame = Resize:enlarge(windowFrame, screen)
  return newFrame
end

--- Command:shrink(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
function obj:shrink(windowFrame, screenFrame)
  local newFrame = Resize:shrink(windowFrame, screen)
  return newFrame
end


--- Command:nextThird(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
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

--- Command:prevThird(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
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

--- Command:nextScreen(windowFrame, screenFrame)
--- Method
--- Inspects current screen frame position, determines how to resize given frame
--- and calls corresponding resize method
---
--- Returns:
--- * A screenFrame to be rendered
function obj:nextScreen(windowFrame, screenFrame)
end

return obj
