Scriptname JailDoorScript extends ObjectReference  
{creates detection event when opened by player}

Event OnActivate(ObjectReference akActionRef)
	CreateDetectionEvent(akActionRef as actor, soundLevel) ; creates a detection event
endEvent

int property SoundLevel = 25 auto
