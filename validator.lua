 local obj = {}
 obj.__index = obj
 obj.name = "Validator"

 function obj:topHalf(window, screen)
  return window.x == screen.x and
         window.y == screen.y and
         window.w == screen.w and
         window.h == (screen.h / 2)
end

function obj:topThird(window, screen)
  return window.x == screen.x and
         window.y == screen.y and
         window.w == screen.w and
         math.floor(window.h) == math.floor(screen.h / 3)
end

function obj:topLeftHalf(window, screen)
  return window.x == screen.x and
         window.y == screen.y and
         window.w == screen.w / 2 and
         window.h == screen.h / 2
end

function obj:topLeftThird(window, screen)
  return window.x == screen.x and
         window.y == screen.y and
         math.floor(window.w) == math.floor(screen.w / 3) and
         window.h == screen.h / 2
end

function obj:bottomHalf(window, screen)
  return window.x == screen.x and
         window.y == (screen.h / 2) + screen.y and
         window.w == screen.w and
         window.h == screen.h / 2
end

function obj:bottomThird(window, screen)
  return window.x == screen.x and
         math.floor(window.y) == math.floor(((screen.h / 3) * 2) + screen.y) and
         window.w == screen.w and
         math.floor(window.h) == math.floor(screen.h / 3)
end

function obj:leftHalf(window, screen)
  return window.x == screen.x and
         window.y == screen.y and
         window.w == screen.w / 2 and
         window.h == screen.h
end

function obj:leftThird(window, screen)
  return window.x == screen.x and
         window.y == screen.y and
         math.floor(window.w) == math.floor(screen.w / 3) and
         window.h == screen.h
end

function obj:rightHalf(window, screen)
  return window.x == (screen.w / 2) + screen.x and
         window.y == screen.y and
         window.w == screen.w / 2 and
         window.h == screen.h
end

function obj:rightThird(window, screen)
  return math.floor(window.x) == math.floor((screen.w / 3) * 2 + screen.x) and
         window.y == screen.y and
         math.floor(window.w) == math.floor(screen.w / 3) and
         window.h == screen.h
end

function obj:centerHorizontalThird(window, screen)
  return window.x == screen.x and
         math.floor(window.y) == math.floor(screen.h / 3) and
         window.w == screen.w and
         math.floor(window.h) == math.floor(screen.h / 3)
end

function obj:centerVerticalThird(window, screen)
  return math.floor(window.x) == math.floor(screen.w / 3) and
         window.y == screen.y and
         math.floor(window.w) == math.floor(screen.w / 3) and
         window.h == screen.h
end

return obj
