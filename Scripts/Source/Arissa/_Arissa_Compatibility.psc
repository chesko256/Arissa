Scriptname _Arissa_Compatibility extends ReferenceAlias

import debug

Actor property PlayerRef auto
Spell property _Arissa_LegacyConfigSpell auto
bool property bIsDLC1Loaded auto hidden		;Dawnguard
Quest property EFF auto hidden
_Arissa_iNPC_Behavior property iNPCSystem auto
bool property isSKSELoaded auto hidden
bool property isSKYUILoaded auto hidden
bool property isImperiousLoaded auto hidden
bool property isConvenientHorsesLoaded auto hidden
bool property isBecomeABardLoaded auto hidden

MagicEffect property ImperiousYffresBlessing auto hidden
GlobalVariable property _LP_BardIsPlaying auto hidden

Event OnInit()
	CompatibilityCheck()
endEvent

Event OnPlayerLoadGame()
	CompatibilityCheck()
endEvent

function CompatibilityCheck()
	
	trace("[Arissa]======================================================================================================")
	trace("[Arissa]     Arissa is now performing compatibility checks. Papyrus warnings about missing or                 ")
	trace("[Arissa]             unloaded files may follow. This is NORMAL and can be ignored.   		                 ")
	trace("[Arissa]======================================================================================================")
	
	bool EFFLoaded = IsPluginLoaded(0x01000EFE, "EFFCore.esm")
	if EFFLoaded
		EFF = Game.GetFormFromFile(0x01000EFE, "EFFCore.esm") as Quest
	endif

	bool skse_loaded = SKSE.GetVersion()
	if skse_loaded
		isSKSELoaded = true
	else
		isSKSELoaded = false
	endif

	if isSKYUILoaded
		isSKYUILoaded = IsPluginLoaded(0x01000814, "SkyUI.esp")
		if !isSKYUILoaded
			;SkyUI was removed since the last save.
		endif
	else
		isSKYUILoaded = IsPluginLoaded(0x01000814, "SkyUI.esp")
		if isSKYUILoaded
			;SkyUI was just loaded.
		endif
	endif

	if isImperiousLoaded
		isImperiousLoaded = IsPluginLoaded(0x002501B5, "Imperious - Races of Skyrim.esp")
		if !isImperiousLoaded
			;Imperious was removed since the last save.
		endif
	else
		isImperiousLoaded = IsPluginLoaded(0x002501B5, "Imperious - Races of Skyrim.esp")
		if isImperiousLoaded
			;Imperious was just loaded.
		endif
	endif

	if isConvenientHorsesLoaded
		isConvenientHorsesLoaded = IsPluginLoaded(0x01020329, "Convenient Horses.esp")
		if !isConvenientHorsesLoaded
			;Convenient Horses was removed since the last save.
		endif
	else
		isConvenientHorsesLoaded = IsPluginLoaded(0x01020329, "Convenient Horses.esp")
		if isConvenientHorsesLoaded
			;Convenient Horses was just loaded.
		endif
	endif

	if isBecomeABardLoaded
		isBecomeABardLoaded = IsPluginLoaded(0x02051223, "LPBards.esp")
		if !isBecomeABardLoaded
			;Become A Bard was removed since the last save.
		endif
	else
		isBecomeABardLoaded = IsPluginLoaded(0x02051223, "LPBards.esp")
		if isBecomeABardLoaded
			;Become A Bard was just loaded.
		endif
	endif

	if isImperiousLoaded
		ImperiousYffresBlessing = Game.GetFormFromFile(0x002501B5, "Imperious - Races of Skyrim.esp") as MagicEffect
	endif

	; Convenient Horses Sanity Check
	if isConvenientHorsesLoaded
		iNPCSystem.SetUseOwnHorse(false)
	else
		iNPCSystem.SetUseOwnHorse()
	endif

	; Store the Become A Bard bard playing global
	if isBecomeABardLoaded
		_LP_BardIsPlaying = Game.GetFormFromFile(0x02051223, "LPBards.esp") as GlobalVariable
	else
		_LP_BardIsPlaying = None
	endif

	;Dialogue animations from Dawnguard do not work; left here for future expansion.
	;/bIsDLC1Loaded = Game.GetFormFromFile(0x02009403, "Dawnguard.esm")
	
	if bIsDLC1Loaded
		iNPCSystem.RF_MoodChangeGuarded = Game.GetFormFromFile(0x020066a2, "Dawnguard.esm") as Idle
		iNPCSystem.RF_MoodChangeOpen = Game.GetFormFromFile(0x020066a3, "Dawnguard.esm") as Idle
		iNPCSystem.RF_MoodChangeSerious = Game.GetFormFromFile(0x020066a0, "Dawnguard.esm") as Idle
		iNPCSystem.RF_MoodChangePlayful = Game.GetFormFromFile(0x020066a1, "Dawnguard.esm") as Idle
	else
		iNPCSystem.RF_MoodChangeGuarded = None
		iNPCSystem.RF_MoodChangeOpen = None
		iNPCSystem.RF_MoodChangeSerious = None
		iNPCSystem.RF_MoodChangePlayful = None
	endif/;

	AddStartupSpells()

	trace("[Arissa]======================================================================================================")
	trace("[Arissa]                            Arissa compatibility check complete.   		                             ")
	trace("[Arissa]======================================================================================================")
	
endFunction

function AddStartupSpells()
	if isSKYUILoaded
		PlayerRef.RemoveSpell(_Arissa_LegacyConfigSpell)
	else
		PlayerRef.AddSpell(_Arissa_LegacyConfigSpell, false)
	endif
endFunction

bool function IsPluginLoaded(int iFormID, string sPluginName)
	if isSKSELoaded
		int i = Game.GetModByName(sPluginName)
		if i != 255
			debug.trace("[Arissa] Loaded: " + sPluginName)
			return true
		else
			return false
		endif
	else
		bool b = Game.GetFormFromFile(iFormID, sPluginName)
		if b
			debug.trace("[Arissa] Loaded: " + sPluginName)
			return true
		else
			return false
		endif
	endif
endFunction