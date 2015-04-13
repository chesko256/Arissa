scriptName defaultEnableEncLinkedRef extends ObjectReference
{
- This script enables its linkedRef based on a the player's level compared to a global
}

bool Property PlayerOnly = TRUE auto
{Does this only trigger for the player? (DEFAULT = TRUE)}

bool Property Fade = FALSE auto
{Fade in/out when enabled (DEFAULT = FALSE)}

GlobalVariable Property EncounterGlobal auto
{usually will use global prefixed with LevelGate, for example LevelGateHagraven}

ObjectReference myLinkedRef

;****************************

Event onCellLoad()
	myLinkedRef = getLinkedRef()
endEvent

;****************************

Auto State waiting
	Event onTriggerEnter(ObjectReference triggerRef)
		if (triggerRef == Game.GetPlayer()) || (!PlayerOnly)
			if(game.GetPlayer().getLevel() >= (EncounterGlobal.getValue()))
				gotoState ("done")
				myLinkedRef.enable(Fade)
			endif
		endif
	endEvent

endState

;****************************

State done
	Event onTriggerEnter(ObjectReference triggerRef)
		;do nothing
	endEvent
endState

;****************************
