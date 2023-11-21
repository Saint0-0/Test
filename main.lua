shared.SkillsTable = {
	C = false,
	E = false,
	F = false,
	R = false,
	SelectedStage = shared.SkillsTable.Stage1,
	Stage1 = false,
	Stage2 = false,
	Stage3 = false,
	Stage4 = false,
	Stage5 = false,
	Stage6 = false
}
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local HttpService = game:GetService("HttpService")

if writefile then
	if not isfolder("Exulus") then
		makefolder("Exulus")
	end
	if not isfolder("Exulus/Cache") then
		makefolder("Exulus/Cache")
	end
	if not isfile("Exulus/Cache/ServerHopData.json") then
		writefile("Exulus/Cache/ServerHopData.json", "")
	end
	if not isfile("Exulus/Cache/Webhook.exu") then
		writefile("Exulus/Cache/Webhook.exu", "Tm8gV2ViaG9vayBTdG9yZWQu")
	end
	if not isfile("Exulus/Cache/Failed_Webhook_Post_Resort.txt") then
		writefile("Exulus/Cache/Failed_Webhook_Post_Resort.txt", "")
	end
	if not isfile("Exulus/Cache/StagesCache.exu") then
		writefile("Exulus/Cache/StagesCache.exu", HttpService:JSONEncode(shared.SkillsTable))
	end
end

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

	})
    -- Farm config tab
	Config:AddParagraph({
		Title = "Select the skills to use",
		Content = ""
	})
    Config:AddToggle({
		Title = "Skill C",
		Default = shared.SkillsTable.C,
		Callback = function(Value)
			shared.SkillsTable.C = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:AddToggle({
		Title = "Skill E",
		Default = shared.SkillsTable.E,
		Callback = function(Value)
			shared.SkillsTable.E = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:AddToggle({
		Title = "Skill F",
		Default = shared.SkillsTable.F,
		Callback = function(Value)
			shared.SkillsTable.F = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:AddToggle({
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

InitialiseFarm()
