ScriptName RazorTriggerScript extends ObjectReference

ObjectReference Property RazorStatic Auto
Weapon Property DA07MehrunesRazor Auto
Quest Property DA07 Auto
ObjectReference Property Altar Auto

Event OnActivate(ObjectReference akActionRef)

	If akActionRef == Game.GetPlayer()
		If (!RegisterForAnimationEvent(Altar, "Done"))			
; 			Debug.Trace(self + "Failed to register for animation event!")
		EndIf
		
	EndIf
	
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (akSource == Altar) && (asEventName == "Done")
; 		debug.Trace(self + "playing Take animation")
		Altar.PlayAnimation("Take")
		DA07.SetStage(100)
		UnregisterForAnimationEvent(self, "Done")
		Self.Disable()
	EndIf
EndEvent