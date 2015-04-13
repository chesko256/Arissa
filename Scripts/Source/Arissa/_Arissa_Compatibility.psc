Scriptname _Arissa_Compatibility extends ReferenceAlias

import debug

bool property bIsDLC1Loaded auto hidden		;Dawnguard
Quest property EFF auto hidden
_Arissa_iNPC_Behavior property iNPCSystem auto

Event OnInit()
	CompatibilityCheck()
endEvent

Event OnPlayerLoadGame()
	CompatibilityCheck()
endEvent

function CompatibilityCheck()
	
	trace("========================================[Arissa: Warning Start]========================================")
	trace("            Arissa is now performing compatibility checks. Papyrus warnings about missing or           ")
	trace("                        unloaded files may follow. This is normal and they can be ignored.                        ")
	trace("========================================[ Arissa: Warning End ]========================================")
	
	EFF = Game.GetFormFromFile(0x01000EFE, "EFFCore.esm") as Quest

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

	trace("========================================[Arissa: Warning Start]========================================")
	trace("                                          Compatibility check complete.                                           ")
	trace("========================================[ Arissa: Warning End ]========================================")
	
endFunction