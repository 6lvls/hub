local hub = {}

hub.games = loadstring(game:HttpGet(
"https://raw.githubusercontent.com/6lvls/hub/main/games.lua"
))()

hub.ui = loadstring(game:HttpGet(
"https://raw.githubusercontent.com/6lvls/hub/main/ui.lua"
))()

local placeId = game.PlaceId
local gameData = hub.games[placeId]

if not gameData then
    warn("Game not supported")
    return
end

hub.ui.create(gameData)
