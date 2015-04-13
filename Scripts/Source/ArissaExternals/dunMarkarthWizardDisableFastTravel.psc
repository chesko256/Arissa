ScriptName dunMarkarthWizardDisableFastTravel extends objectReference
{Script to disable fast travel while the player is on the Markarth Balcony to encourage use of the waterfall jump.}

TG06QuestScript Property pTG06QS Auto
Quest Property pTG06 Auto

Event onTriggerEnter(ObjectReference triggerRef)
	if (triggerRef == Game.GetPlayer())
		Game.EnableFastTravel(False)
		if pTG06.GetStage() == 50
			pTG06QS.pTG06Waterfall = 1
		endif
	EndIf
EndEvent

Event onTriggerLeave(ObjectReference triggerRef)
	if (triggerRef == Game.GetPlayer())
		Game.EnableFastTravel(True)
		if pTG06.GetStage() == 50
			pTG06QS.pTG06Waterfall = 0
		endif
	EndIf
EndEvent