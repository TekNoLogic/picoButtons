
local IHASCAT = select(4, GetBuildInfo()) >= 40000

local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local microcoord = {0, 1, 22/64, 1}


local i = 0
local function helper(title, button, label, icon, coords, click)
	ldb:NewDataObject(i.. " MicroButton "..title, {
		type = "launcher",
		icon = icon or "Interface\\Buttons\\UI-MicroButton-"..title.."-Up",
		texcoord = coords or (not icon and microcoord),
		iconCoords = coords or (not icon and microcoord),
		OnClick = click or button:GetScript("OnClick"),
		label = label,
	})
	i = i + 1
end


local x = MainMenuMicroButton:GetScript("OnMouseUp")
local function mainmenu(self, ...) self.down = 1; x(self, ...) end

helper("Character", CharacterMicroButton, CHARACTER_BUTTON, "Interface\\GroupFrame\\UI-Group-LeaderIcon", nil, function() ToggleCharacter("PaperDollFrame") end)
helper("Spellbook", SpellbookMicroButton, SPELLBOOK_ABILITIES_BUTTON)
helper("Talents", TalentMicroButton, TALENTS_BUTTON)
helper("Achievement", AchievementMicroButton, ACHIEVEMENT_BUTTON)
helper("Quest", QuestLogMicroButton, QUESTLOG_BUTTON)
helper("Guild", GuildMicroButton, GUILD, "Interface\\Buttons\\UI-MicroButton-Socials-Up", microcoord)
helper("PVP", PVPMicroButton, PLAYER_V_PLAYER, "Interface\\TargetingFrame\\UI-PVP-"..UnitFactionGroup("player"), {0, 5/8, 0, 5/8}, function() ToggleFrame(PVPParentFrame) end)
helper("LFD", LFDMicroButton, DUNGEONS_BUTTON, "Interface\\Buttons\\UI-MicroButton-LFG-Up", microcoord)
helper("MainMenu", MainMenuMicroButton, MAINMENU_BUTTON, nil, nil, mainmenu)
helper("Help", HelpMicroButton, HELP_BUTTON)


---------------------------
--      About panel      --
---------------------------

local about = LibStub("tekKonfig-AboutPanel").new(nil, "picoButtons")
