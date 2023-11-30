shared.SkillsTable = {
	C = false,
	E = false,
	F = false,
	R = false,
	Stage1 = false,
	Stage2 = false,
	Stage3 = false,
	Stage4 = false,
	Stage5 = false,
	Stage6 = false,
	SelectedStage = "Stage1"
}
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
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

    local Window = Rayfield:CreateWindow({
        Name = "Ξxulus",
        LoadingTitle = "Ξxulus",
		LoadingSubtitle = "by saint.dev",
		ConfigurationSaving = {
			Enabled = false,
		}
    })

	--Options
	local Options = Rayfield.Options

	-- Tabs
	local Stats = Window:CreateTab("Stats", "Car")
    local Farm = Window:CreateTab("Farm", "Car")
    local Config = Window:CreateTab("Farm configuration", "Car")
    local Modules = Window:CreateTab("Weapon modules", "Car")
	local Extras = Window:CreateTab("Extras", "Car")

	-- Functions
	local function SaveData(Data)
		local TemporaryVariable = HttpService:JSONEncode(Data)
		writefile("Exulus/Cache/StagesCache.exu", TemporaryVariable)
	end

	-- Stats tab
	local StatsText = Stats:CreateParagraph({
		Title = "Your stats",
		Content = "Loading"
	})
	coroutine.wrap(function()
		while task.wait() do
			StatsText:Set({
				Title = "Your stats",
				Content = "Ping: "..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():gsub("%b()%s*", ""):gsub("^%s*(.-)%s*$", "%1"):sub(1, -5).."\nFPS: "..math.floor((2 % 1 >= 0.5 and math.ceil(2) or math.floor(2))/wait()).."\nMemory Usage: "..math.floor(game:GetService("Stats"):GetTotalMemoryUsageMb()).."\n\nPlayers: "..#game:GetService("Players"):GetPlayers()
			})
		end
	end)()
	
    -- Farm config tab
	Config:CreateLabel("Select the skill to use.")
	
    Config:CreateToggle({
		Name = "Skill C",
		CurrentValue = shared.SkillsTable.C,
		Callback = function(Value)
			shared.SkillsTable.C = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:CreateToggle({
		Name = "Skill E",
		CurrentValue = shared.SkillsTable.E,
		Callback = function(Value)
			shared.SkillsTable.E = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:CreateToggle({
		Name = "Skill F",
		CurrentValue = shared.SkillsTable.F,
		Callback = function(Value)
			shared.SkillsTable.F = Value
			SaveData(shared.SkillsTable)
		end
	})
	Config:CreateToggle({
		Name = "Skill R",
		CurrentValue = shared.SkillsTable.R,
		Callback = function(Value)
			shared.SkillsTable.R = Value
			SaveData(shared.SkillsTable)
		end
	})

	-- Stages
	Config:CreateLabel("Select the stage to use.")

	local selectedToggle = nil

	for i = 1, 3 do
		local stageName = "Stage"..i
		local TempToggle = Config:CreateToggle({
			Name = "Stage: "..i,
			CurrentValue = shared.SkillsTable[stageName],
			Callback = function(Value)
				if Value then
					if selectedToggle then
						selectedToggle:Set(false)
						shared.SkillsTable[selectedToggle.Name] = false
					end
					selectedToggle = TempToggle
				end
				shared.SkillsTable[stageName] = Value
				SaveData(shared.SkillsTable)
			end
		})

		-- Initialize selectedToggle if the stage is already selected
		if shared.SkillsTable[stageName] then
			selectedToggle = TempToggle
		end
	end

	-- Extras tab

	Window:SelectTab(1)

end

InitialiseFarm()
