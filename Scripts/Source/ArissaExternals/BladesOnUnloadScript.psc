ScriptName BladesOnUnloadScript extends ReferenceAlias

Event OnUnload()

	;Move Blades to the Dragon Lair
	If (GetOwningQuest().GetStageDone(10) == 1) && (GetOwningQuest().GetStageDone(15) == 0)
		GetOwningQuest().SetStage(15)
	EndIf

	;Move Blades back to Skyhaven
	If (GetOwningQuest().GetStageDone(20) == 1) && (GetOwningQuest().GetStageDone(25) == 0)
		GetOwningQuest().SetStage(25)
	EndIf

EndEvent