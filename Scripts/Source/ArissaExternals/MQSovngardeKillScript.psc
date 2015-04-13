Scriptname MQSovngardeKillScript extends ObjectReference  
{kill player if he falls into the trigger}

EVENT onTriggerEnter(objectReference triggerRef)
	Actor triggerActor = triggerRef as Actor
	if (triggerActor == Game.GetPlayer())
		; kill player
		triggerActor.Kill()
	endif
endEVENT
