Scriptname TG08BEncounterTrigger01Script extends ObjectReference  Conditional

int Property pTG08BTriggerDone Auto
Quest Property pTG08BQuest Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if pTG08BTriggerDone == 0
		if akActionRef == Game.GetPlayer()
		Game.DisablePlayerControls(true,true,true,false,true,true,true,false)
			utility.wait(1)
			pTG08BQuest.SetStage(35)
			pTG08BTriggerDone = 1
		endif
	endif

EndEvent
