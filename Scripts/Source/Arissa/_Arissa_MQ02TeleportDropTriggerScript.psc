Scriptname _Arissa_MQ02TeleportDropTriggerScript extends ObjectReference  

ObjectReference property TeleportTarget auto
_Arissa_iNPC_Behavior property iNPCSystem auto
Quest property _Arissa_MQ02 auto

Event OnTrigger(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		akActionRef.MoveTo(TeleportTarget)
	endif
endEvent