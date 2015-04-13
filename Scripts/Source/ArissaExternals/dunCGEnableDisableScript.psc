scriptName dunCGEnableDisableScript extends ObjectReference
{
- This script handles enabling/disabling of rubbles piles in charGen
}

int property TriggerType auto
{
0 (default) - enables linked ref
1 - disables linked ref
}

keyword property Structure auto
keyword property FX auto
keyword property Clutter auto

objectReference myStructureLink
objectReference myFXLink
objectReference myClutterLink

Event onCellLoad()
	if(getLinkedRef(Structure))
		myStructureLink = getLinkedRef(Structure) as ObjectReference
	endif
	
	if(getLinkedRef(FX))
		myFXLink = getLinkedRef(FX) as ObjectReference
	endif
	
	if(getLinkedRef(Clutter))
		myClutterLink = getLinkedRef(Clutter) as ObjectReference
	endif

endEvent

Event onTriggerEnter(ObjectReference triggerRef)
	Actor actorRef = triggerRef as Actor
	if (actorRef == game.GetPlayer())
		if(myStructureLink)
			if(TriggerType == 0)
				myStructureLink.enable()
			else
				myStructureLink.disable()
			endif
		endif
		
		if(myFXLink)
			if(TriggerType == 0)
				myFXLink.enable()
			else
				myFXLink.disable()
			endif
		endif
		
		if(myClutterLink)
			if(TriggerType == 0)
				myClutterLink.enable()
			else
				myClutterLink.disable()
			endif
		endif
	endif
endEvent
