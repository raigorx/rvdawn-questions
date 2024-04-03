-- magic numbers makes code hard to read and understand
-- without more context is hard to know what exactly these numbers mean
-- if these numbers are used in multiple places, it would be better to have it in a single place
local RESET_STORAGE = -1
local STORAGE_KEY = 1000

local function releaseStorage(player)
  player:setStorageValue(STORAGE_KEY, RESET_STORAGE)
end

-- without more context/code is hard to know what this function does
function onLogout(player)
  if player:getStorageValue(STORAGE_KEY) == 1 then
    addEvent(releaseStorage, STORAGE_KEY, player)
  end
  -- return true
  -- this return seems to be pointless, the fact the call to the function didn't throw an error
  -- is enough to know the function was called successfully
end
