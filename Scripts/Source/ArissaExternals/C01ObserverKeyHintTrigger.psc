Scriptname C01ObserverKeyHintTrigger extends ObjectReference  

Scene Property HintScene auto
Key Property CairnKey auto
Quest Property C01 auto

auto State WaitingForPlayer
	Event OnTriggerEnter(ObjectReference akActivator)
		if (Game.GetPlayer() == akActivator)
			RegisterForUpdate(15)
			GoToState("PlayerTriggered")
		endif
	EndEvent
EndState


State PlayerTriggered
EndState


Event OnUpdate()
	if (C01.IsCompleted() || Game.GetPlayer().GetItemCount(CairnKey) == 1)
		UnregisterForUpdate()
		Disable()
		Delete()
	else
		HintScene.Start()
	endif
EndEvent
