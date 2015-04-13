Scriptname defaultEnableLinkedRefOnLostLOS extends ObjectReference  
{enable OR disable linked ref onLostLOS}

bool property bEnableOnLostLOS = true  auto  
{true (default) = enable linked ref
false = disable linked ref
}

ObjectReference property myLookTarget auto
{the target that when player looks away, triggers the enable/disable}

Keyword property LinkedRefKeyword  auto  
{optional - if supplied, use this for GetLinkedRef}

;************************************

Event OnLostLOS(Actor akViewer, ObjectReference akTarget)
		; get linked ref
		ObjectReference myRef = GetLinkedRef(LinkedRefKeyword)
		if(myRef)
			if(bEnableOnLostLOS)
				myRef.Enable()
			else
				myRef.Disable()
			endif
		endif
endEvent

;************************************

auto State Waiting
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer())
			gotoState("done")
			RegisterForSingleLOSLost(Game.GetPlayer(), myLookTarget)
		endif
	endEvent

	
endState

;************************************

State done
	;do nothing
endState

;************************************