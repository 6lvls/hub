local ui = {}

function ui.create(gameData)

local gui = Instance.new("ScreenGui", game.CoreGui)

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,450,0,350)
main.Position = UDim2.new(0.5,-225,0.5,-175)

local search = Instance.new("TextBox", main)
search.Size = UDim2.new(1,-20,0,30)
search.Position = UDim2.new(0,10,0,10)
search.PlaceholderText = "Search scripts..."

local tabFrame = Instance.new("Frame", main)
tabFrame.Size = UDim2.new(0,120,1,-50)
tabFrame.Position = UDim2.new(0,0,0,50)

local scriptFrame = Instance.new("ScrollingFrame", main)
scriptFrame.Size = UDim2.new(1,-130,1,-50)
scriptFrame.Position = UDim2.new(0,130,0,50)

local tabs = {}

for _,script in ipairs(gameData.scripts) do
    tabs[script.tab] = true
end

for tabName,_ in pairs(tabs) do
    local tabButton = Instance.new("TextButton", tabFrame)
    tabButton.Size = UDim2.new(1,0,0,30)
    tabButton.Text = tabName

    tabButton.MouseButton1Click:Connect(function()

        scriptFrame:ClearAllChildren()

        for _,script in ipairs(gameData.scripts) do
            if script.tab == tabName then

                local button = Instance.new("TextButton", scriptFrame)
                button.Size = UDim2.new(1,-10,0,50)
                button.Text = script.name.." - "..script.description

                button.MouseButton1Click:Connect(function()
                    loadstring(game:HttpGet(script.url))()
                end)

            end
        end

    end)
end

end

return ui
