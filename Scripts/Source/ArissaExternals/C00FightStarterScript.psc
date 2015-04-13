Scriptname C00FightStarterScript extends ObjectReference  

Quest Property FightQuest auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		FightQuest.SetStage(1)
		Delete()
	endif
EndEvent
