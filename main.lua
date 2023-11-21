function InitialiseFarm()
	--bro
	shared.SkillsTable = {
		C = false,
		E = false,
		F = false,
		R = false
	}
	-- Populating the shared.SkillsTable
	shared.SkillsTable = HttpService:JSONDecode(readfile("Exulus/Cache/StagesCache.exu"))

    local Window = Fluent:CreateWindow({
        Title = "Ξxulus",
        SubTitle = "by saint.dev",
        TabWidth = 160,
        Size = UDim2.fromOffset(200, 200),
        Acrylic = true,
        Theme = "Dark"
    })

	-- Tabs
    local Farm = Window:AddTab({Title = "Farm", Icon = "Car"})
    local Config = Window:AddTab({Title = "Farm configuration", Icon = "Car"})
    local Modules = Window:AddTab({Title = "Weapon modules", Icon = "Car"})

	-- Functions
	local function SaveData(Data)
		local TemporaryVariable = HttpService:JSONEncode(Data)
		writefile("Exulus/Cache/StagesCache.exu", TemporaryVariable)
	end

    -- Farm config tab
    Config:AddToggle("Skill C", {
		Title = "Auto click",
		Default = shared.SkillsTable.C,
		Callback = function(Value)
			shared.SkillsTable.C = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:AddToggle("Skill E", {
		Title = "Auto click",
		Default = shared.SkillsTable.E,
		Callback = function(Value)
			shared.SkillsTable.E = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:AddToggle("Skill F", {
		Title = "Auto click",
		Default = shared.SkillsTable.F,
		Callback = function(Value)
			shared.SkillsTable.F = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:AddToggle("Skill R", {
		Title = "Auto click",
		Default = shared.SkillsTable.R,
		Callback = function(Value)
			shared.SkillsTable.R = Value
			SaveData(shared.SkillsTable)
		end
	})

end

InitialiseFarm()
