Scriptname C01AmbushSpaceEntranceTrigger extends ObjectReference  


C01QuestScript Property C01 auto

Scene Property HintScene auto

bool __playedPrompt = false

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		C01.PlayerEnteredAmbushZone(true)
		if (__playedPrompt)
			HintScene.Start()
			__playedPrompt = true
		endif
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		C01.PlayerEnteredAmbushZone(false)
	endif
EndEvent
