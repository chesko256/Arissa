Scriptname DA08OutsideJarlsQuartersTriggerScript extends ReferenceAlias  


ReferenceAlias Property Frothar auto

Event OnTriggerEnter(ObjectReference akActivator)
; 	Debug.Trace("DA08: " + akActivator + " entering trigger outside Jarl's quarters.")
	DA08QuestScript da08script = (GetOwningQuest() as DA08QuestScript)
	if (akActivator == Game.GetPlayer())
		da08script.PlayerOutsideJarlsQuarters = True
	elseif (akActivator == Frothar.GetActorReference())
		da08script.FrotharOutsideJarlsQuarters = True
	endif

	if (da08script.PlayerOutsideJarlsQuarters && \ 
			(da08script.FrotharOutsideJarlsQuarters || Game.GetPlayer().GetDistance(Frothar.GetReference()) < 1000) \
		)
		; da08script.KidsAttack()
		GetReference().Disable()
	else
; 		Debug.Trace("DA08: Not starting death scene -- " + da08script.PlayerOutsideJarlsQuarters + " " + da08script.FrotharOutsideJarlsQuarters)
	endif
EndEvent


Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
; 		Debug.Trace("DA08: Player leaving trigger.")
		(GetOwningQuest() as DA08QuestScript).PlayerOutsideJarlsQuarters = False
	elseif (akActivator == Frothar.GetActorReference())
; 		Debug.Trace("DA08: Frothar leaving trigger.")
		(GetOwningQuest() as DA08QuestScript).FrotharOutsideJarlsQuarters = False
	endif
EndEvent
