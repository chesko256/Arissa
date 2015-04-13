ScriptName TiberSeptimBedScript extends ReferenceAlias

Event OnActivate(ObjectReference akActionRef)

	If (akActionRef == Game.GetPlayer()) && (GetOwningQuest().GetStageDone(5) == 0)
		GetOwningQuest().SetStage(5)
		RegisterforSleep()
	EndIf
	
EndEvent

Event OnSleepStop(bool abInterrupted)

	If GetOwningQuest().GetStageDone(10) == 0
		GetOwningQuest().SetStage(10)
		UnregisterForSleep()
	EndIf

EndEvent