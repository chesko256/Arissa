Scriptname JorrvaskrEnvironsTriggerScript extends ReferenceAlias  


Event OnTriggerEnter(ObjectReference akActivator)
	if (Game.GetPlayer() == akActivator)
		(GetOwningQuest() as CompanionsDialogueScript).PlayerAroundJorrvaskr = True
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	if (Game.GetPlayer() == akActivator)
		(GetOwningQuest() as CompanionsDialogueScript).PlayerAroundJorrvaskr = False
	endif
EndEvent
