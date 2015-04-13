Scriptname CWGuardOffLimitsAreaTriggerScript extends ObjectReference  
{Script on CWGuardOffLimitsAreaTrigger to make guards think player is tresspassing in areas of castles that should be off limits.}

GlobalVariable Property CWPlayerInGuardOffLimitsArea Auto

Event OnTriggerEnter(ObjectReference akActionRef)
; 	debug.trace(self + "OnTriggerEnter( " + akActionRef + ")")

	if akActionRef == Game.GetPlayer()
		modGlobal(1)
	
	EndIf
	
EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
; 	debug.trace(self + "OnTriggerLeave( " + akActionRef + ")")

	if akActionRef == Game.GetPlayer()
		modGlobal(-1)
	
	EndIf
	
EndEvent

Function modGlobal(int amountToMod)

	float GlobalVal = CWPlayerInGuardOffLimitsArea.GetValue() + amountToMod
	
	CWPlayerInGuardOffLimitsArea.SetValue(GlobalVal)
	
; 	debug.trace(self + "modGlobal() CWPlayerInGuardOffLimitsArea ==" + GlobalVal)
	
EndFunction
