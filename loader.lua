-- update 1 added error logging cuz ts not workin chat
local hub = {}

local gamesSource = game:HttpGet("https://raw.githubusercontent.com/6lvls/hub/refs/heads/main/games.lua")
local gamesFunc = loadstring(gamesSource)

if not gamesFunc then
    error("Failed to load games.lua")
end

hub.games = gamesFunc()

local uiSource = game:HttpGet("https://raw.githubusercontent.com/6lvls/hub/refs/heads/main/ui.lua")
local uiFunc = loadstring(uiSource)

if not uiFunc then
    error("Failed to load ui.lua")
end

hub.ui = uiFunc()

local placeId = game.PlaceId
local gameData = hub.games[placeId]

if not gameData then
    warn("Game not supported")
    return
end

hub.ui.create(gameData)
