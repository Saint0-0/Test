function InitialiseFarm()
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local Window = Fluent:CreateWindow({
        Title = "Ξxulus",
        SubTitle = "by saint.dev",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Dark"
    })

    local Farm = Window:AddTab({Title = "Farm", Icon = "Car"})
    local Config = Window:AddTab({Title = "Farm configuration", Icon = "Car"})
    local Modules = Window:AddTab({Title = "Weapon modules", Icon = "Car"})

    
end

InitialiseFarm()
