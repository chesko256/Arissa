Scriptname WIChangeLocation09GuardScript extends ReferenceAlias  

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
	;Registered for single LOS gain on the dragon specifically in Stage 0
; 	debug.trace("WIChangeLocation09GuardScript OnGainLOS()" + self)
	
	quest myQuest = GetOwningQuest()
	
	if myQuest.GetStageDone(1) == False
; 		debug.trace("WIChangeLocation09GuardScript OnGainLOS()" + self + " setting stage 1 to start scene")
		
		myQuest.SetStage(1)
	EndIf

EndEvent
