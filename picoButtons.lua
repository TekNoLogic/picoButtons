
local myname, ns = ...


local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local microcoord = {0, 1, 22/64, 1}


local i = 0
local function helper(title, button, label, icon, coords, click)
	local name = string.format("%02d MicroButton %s", i, title)
  ldb:NewDataObject(name, {
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


helper("Character", CharacterMicroButton, CHARACTER_BUTTON,
       "Interface\\GroupFrame\\UI-Group-LeaderIcon", nil,
       function() ToggleCharacter("PaperDollFrame") end)

helper("Spellbook", SpellbookMicroButton, SPELLBOOK_ABILITIES_BUTTON)

helper("Talents", TalentMicroButton, TALENTS_BUTTON)

helper("Achievement", AchievementMicroButton, ACHIEVEMENT_BUTTON)

helper("Quest", QuestLogMicroButton, QUESTLOG_BUTTON)

helper("Guild", GuildMicroButton, GUILD,
       "Interface\\Buttons\\UI-MicroButton-Socials-Up", microcoord)

helper("LFG", LFDMicroButton, DUNGEONS_BUTTON)

if ns.is_six_one then
	helper("Mounts", CollectionsMicroButton, COLLECTIONS)
else
	helper("Mounts", CompanionsMicroButton, COLLECTIONS)
end

helper("EJ", EJMicroButton, ENCOUNTER_JOURNAL)

helper("BStore", StoreMicroButton, ENCOUNTER_JOURNAL)

helper("MainMenu", MainMenuMicroButton, MAINMENU_BUTTON, nil, nil, mainmenu)
