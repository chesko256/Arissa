Scriptname _Arissa_MQ02_CaveExitTriggerScript extends ObjectReference  

_Arissa_iNPC_Behavior property iNPCSystem auto

Event OnTrigger(ObjectReference akActionRef)
	if iNPCSystem.CanWait == false
		iNPCSystem.CanWait = true
	endif
endEvent