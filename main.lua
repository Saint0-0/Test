function InitialiseFarm()

	-- Populating the shared.SkillsTable
	shared.SkillsTable = HttpService:JSONDecode(readfile("Exulus/Cache/StagesCache.exu"))

    local Window = Fluent:CreateWindow({
        Title = "Ξxulus",
        SubTitle = "by saint.dev",
        TabWidth = 160,
        Size = UDim2.fromOffset(400, 400),
        Acrylic = true,
        Theme = "Dark"
    })

	--Options
	local Options = Fluent.Options

	-- Tabs
	local Stats = Window:AddTab({Title = "Farm", Icon = "Car"})
    local Farm = Window:AddTab({Title = "Farm", Icon = "Car"})
    local Config = Window:AddTab({Title = "Farm configuration", Icon = "Car"})
    local Modules = Window:AddTab({Title = "Weapon modules", Icon = "Car"})
	local Extras = Window:AddTab({Title = "Extras", Icon = "Car"})

	-- Functions
	local function SaveData(Data)
		local TemporaryVariable = HttpService:JSONEncode(Data)
		writefile("Exulus/Cache/StagesCache.exu", TemporaryVariable)
	end

	-- Stats tab
	Stats:AddParagraph({
		Title = "Hello world"
	})
    -- Farm config tab
	Config:AddParagraph({
		Title = "Select the skills to use",
		Content = ""
	})
    Config:AddToggle("SkillC", {
		Title = "Skill C",
		Default = shared.SkillsTable.C,
		Callback = function(Value)
			shared.SkillsTable.C = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:AddToggle("SkillE", {
		Title = "Skill E",
		Default = shared.SkillsTable.E,
		Callback = function(Value)
			shared.SkillsTable.E = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:AddToggle("SkillF", {
		Title = "Skill F",
		Default = shared.SkillsTable.F,
		Callback = function(Value)
			shared.SkillsTable.F = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:AddToggle("SkillR", {
		Title = "Skill R",
		Default = shared.SkillsTable.R,
		Callback = function(Value)
			shared.SkillsTable.R = Value
			SaveData(shared.SkillsTable)
		end
	})

	-- Extras tab
	Extras:AddDropdown({
		Title = "Pick a theme",
		Values = {"Amethyst", "Aqua", "Dark", "Darker", "Light", "Rose"},
		Multi = false,
		Default = "Dark",
		Callback = function(Choice)
			Fluent:SetTheme(Choice)
		end
	})
	-- Stages
	Config:AddParagraph({
		Title = "Select the stage to use",
		Content = ""
	})

	for i = 1, 3  do -- three is the amount of stages that a person could have, change it to a variable later
		Config:AddToggle("Stage"..i{
			Title = "Stage: "..i,
			Default = false,
			Callback = function(Value)
				if Options["Stage"..i] == shared.SkillsTable.SelectedStage then
					Options["Stage"..i]:SetValue(Value)
					shared.SkillsTable["Stage"..i] = Value
					SaveData(shared.SkillsTable)
				else
					Options["Stage"..i]:SetValue(false)
					shared.SkillsTable["Stage"..i] = false
					SaveData(shared.SkillsTable)
				end
			end
		})
	end

	Window:SelectTab(1)

end
