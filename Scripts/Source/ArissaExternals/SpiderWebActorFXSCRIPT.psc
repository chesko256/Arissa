scriptName SpiderWebActorFXSCRIPT extends ObjectReference


ObjectReference property webActor auto
{The actor in the web}

EffectShader Property WebbedFXS auto

;*****************************************

Auto STATE Waiting
	Event onTriggerEnter (objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.GetPlayer())
			gotoState("done")
			WebbedFXS.Play(webActor)
		endif
	endEvent
	
endState

;*****************************************

STATE done
	;do nothing
endState

;*****************************************