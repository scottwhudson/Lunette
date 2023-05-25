local obj = {}
obj.__index = obj
obj.name = "Resize"

function obj:resizeLeft(window, screen)
  local by = screen.w * 0.05

  -- we are on the left side of the screen shrink from the right
  if window.x == 0 then
    if window.w < by then
      return window
    end
    window.w = window.w - by
    return window
  end

  -- grow to the left
  if window.x - by < screen.x then
    window.w = window.w + (window.x - screen.x)
    window.x = screen.x
  else
    window.x = window.x - by
    window.w = window.w + by
  end

  return window
end

function obj:resizeRight(window, screen)
  local by = screen.w * 0.05

  -- we are on the right side of the screen shrink from the left
  if (window.x + window.w) == screen.w or (window.x == 0 and window.w == screen.w) then
    if window.w < by then
      return window
    end
    window.x = window.x + by
    window.w = window.w - by
    return window
  end

  -- grow to the right only if space is available
  if window.x + window.w + by > screen.w then
    window.w = screen.w - window.x
  else
    window.w = window.w + by
  end

  return window
end

function obj:resizeUp(window, screen)
  local by = screen.h * 0.05

  -- shrink towards top
  if window.y == screen.y or window.h == screen.h then
    if window.h < by then
      return window
    end
    window.h = window.h - by
    return window
  end

  -- grow towards top
  if window.y - by < screen.y then
    window.h = window.h + window.y - screen.y
    window.y = screen.y
  else
    window.y = window.y - by
    window.h = window.h + by
  end

  return window
end

function obj:resizeDown(window, screen)
  local by = screen.h * 0.05

  -- shrink towards bottom
  if ((window.y + window.h - screen.y) == screen.h) or (window.h == screen.h) then
    if window.h < by then
      return window
    end
    window.h = window.h - by
    window.y = window.y + by
    return window
  end

  -- grow towards bottom
  if (window.y - screen.y) + window.h + by > screen.h then
    -- +--------
    -- SSSSSSSSS
    --
    -- WWWWWWWWW
    -- W       W
    -- WWWWWWWWW
    --
    -- S/-------

    window.h = window.h + (screen.h - (window.y - screen.y) - window.h)
  else
    window.h = window.h + by
  end

  return window
end

function obj:enlarge(window, screen)
  if (window.x - 10) >= screen.x then
    window.x = window.x - 10
  end

  if (window.y - 10) >= screen.y then
    window.y = window.y - 10
  end

  window.w = window.w + 20
  window.h = window.h + 20

 return window
end

function obj:fullScreen(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = screen.w
  window.h = screen.h

  return window
end

function obj:center(window, screen)
  window.x = ((screen.w - window.w) // 2) + screen.x
  window.y = ((screen.h - window.h) // 2) + screen.y

  return window
end

function obj:shrink(window, screen)
  window.x = window.x + 10
  window.y = window.y + 10
  window.w = window.w - 20
  window.h = window.h - 20

  return window
end

function obj:topHalf(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = screen.w
  window.h = screen.h // 2

  return window
end

function obj:topLeftHalf(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = screen.w // 2
  window.h = screen.h // 2

  return window
end

function obj:topLeftThird(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = screen.w // 3
  window.h = screen.h // 2

  return window
end

function obj:topLeftTwoThirds(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = (screen.w // 3) * 2
  window.h = screen.h // 2

  return window
end

function obj:topRightHalf(window, screen)
  window.x = (screen.w // 2) + screen.x
  window.y = screen.y
  window.w = screen.w // 2
  window.h = screen.h // 2

  return window
end

function obj:topRightThird(window, screen)
  window.x = ((screen.w // 3) * 2) + screen.x
  window.y = screen.y
  window.w = screen.w // 3
  window.h = screen.h // 2

  return window
end

function obj:topRightTwoThirds(window, screen)
  window.x = (screen.w // 3) + screen.x
  window.y = screen.y
  window.w = (screen.w // 3) * 2
  window.h = screen.h // 2

  return window
end

function obj:topThird(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = screen.w
  window.h = screen.h // 3

  return window
end

function obj:topTwoThirds(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = screen.w
  window.h = (screen.h // 3) * 2

  return window
end

function obj:bottomHalf(window, screen)
  window.x = screen.x
  window.y = (screen.h // 2) + screen.y
  window.w = screen.w
  window.h = screen.h // 2

  return window
end

function obj:bottomLeftHalf(window, screen)
  window.x = screen.x
  window.y = (screen.h // 2) + screen.y
  window.w = screen.w // 2
  window.h = screen.h // 2

  return window
end

function obj:bottomLeftThird(window, screen)
  window.x = screen.x
  window.y = (screen.h // 2) + screen.y
  window.w = screen.w // 3
  window.h = screen.h // 2

  return window
end

function obj:bottomLeftTwoThirds(window, screen)
  window.x = screen.x
  window.y = (screen.h // 2) + screen.y
  window.w = (screen.w // 3) * 2
  window.h = screen.h // 2

  return window
end

function obj:bottomRightHalf(window, screen)
  window.x = (screen.w // 2) + screen.x
  window.y = (screen.h // 2) + screen.y
  window.w = screen.w // 2
  window.h = screen.h // 2

  return window
end

function obj:bottomRightThird(window, screen)
  window.x = ((screen.w // 3) * 2) + screen.x
  window.y = (screen.h // 2) + screen.y
  window.w = screen.w // 3
  window.h = screen.h // 2

  return window
end

function obj:bottomRightTwoThirds(window, screen)
  window.x = (screen.w // 3) + screen.x
  window.y = (screen.h // 2) + screen.y
  window.w = (screen.w // 3) * 2
  window.h = screen.h // 2

  return window
end

function obj:bottomThird(window, screen)
  window.x = screen.x
  window.y = ((screen.h // 3) * 2) + screen.y
  window.w = screen.w
  window.h = screen.h // 3

  return window
end

function obj:bottomTwoThirds(window, screen)
  window.x = screen.x
  window.y = (screen.h // 3) + screen.y
  window.w = screen.w
  window.h = (screen.h // 3) * 2

  return window
end

function obj:leftHalf(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = screen.w // 2
  window.h = screen.h

  return window
end

function obj:leftThird(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = screen.w // 3
  window.h = screen.h

  return window
end

function obj:leftTwoThirds(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = (screen.w // 3) * 2
  window.h = screen.h

  return window
end

function obj:leftThreeQuarters(window, screen)
  window.x = screen.x
  window.y = screen.y
  window.w = (screen.w // 4) * 3
  window.h = screen.h

  return window
end

function obj:rightHalf(window, screen)
  window.x = (screen.w // 2) + screen.x
  window.y = screen.y
  window.w = screen.w // 2
  window.h = screen.h

  return window
end

function obj:rightThird(window, screen)
  window.x = (screen.w // 3) * 2 + screen.x
  window.y = screen.y
  window.w = screen.w // 3
  window.h = screen.h

  return window
end

function obj:rightTwoThirds(window, screen)
  window.x = (screen.w // 3) + screen.x
  window.y = screen.y
  window.w = (screen.w // 3) * 2
  window.h = screen.h

  return window
end

function obj:rightThreeQuarters(window, screen)
  window.x = (screen.w // 4) + screen.x
  window.y = screen.y
  window.w = (screen.w // 4) * 3
  window.h = screen.h

  return window
end

function obj:centerHorizontalThird(window, screen)
  window.x = screen.x
  window.y = screen.h // 3
  window.w = screen.w
  window.h = screen.h // 3

  return window
end

function obj:centerVerticalThird(window, screen)
  window.x = screen.w // 3
  window.y = screen.y
  window.w = screen.w // 3
  window.h = screen.h

  return window
end

return obj
