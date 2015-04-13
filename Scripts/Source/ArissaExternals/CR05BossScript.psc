Scriptname CR05BossScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
; 	Debug.Trace("CRQ CR05: Boss dying.")
	if ((GetOwningQuest() as CompanionsRadiantQuest).IsAccepted)
; 		Debug.Trace("CRQ CR05: Accepted quest; progress.")
		GetOwningQuest().SetStage(20)
	else
; 		Debug.Trace("CRQ CR05: Quest not accepted; silently shut down.")
		(GetOwningQuest() as CompanionsRadiantQuest).PrematureShutdown()
	endif
EndEvent
