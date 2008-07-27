
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local microcoord = {0, 1, 22/64, 1}


local i = 0
local function helper(title, button, label, icon)
	ldb:NewDataObject(i.. " MicroButton "..title, {
		type = "launcher",
		icon = icon or "Interface\\Buttons\\UI-MicroButton-"..title.."-Up",
		texcoord = not icon and microcoord,
		OnClick = button:GetScript("OnClick"),
		label = label,
	})
	i = i + 1
end


helper("Character", CharacterMicroButton, CHARACTER_BUTTON, "Interface\\GroupFrame\\UI-Group-LeaderIcon")
helper("Spellbook", SpellbookMicroButton, SPELLBOOK_ABILITIES_BUTTON)
helper("Talents", TalentMicroButton, TALENTS_BUTTON)
helper("Achievement", AchievementMicroButton, ACHIEVEMENT_BUTTON)
helper("Quest", QuestLogMicroButton, QUESTLOG_BUTTON)
helper("Socials", SocialsMicroButton, SOCIAL_BUTTON)
helper("LFG", LFGMicroButton, LFG_BUTTON)
helper("MainMenu", MainMenuMicroButton, MAINMENU_BUTTON)
helper("Help", HelpMicroButton, HELP_BUTTON)


---------------------------
--      About panel      --
---------------------------

local about = LibStub("tekKonfig-AboutPanel").new(nil, "picoButtons")
