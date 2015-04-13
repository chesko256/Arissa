ScriptName DA07DagonAltarScript extends ObjectReference

ObjectReference Property DA07RazorTriggerREF Auto
Quest Property DA07 Auto
Weapon Property DA07MehrunesRazor Auto

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.Trace(self + "registering for animation event")
	if (akSource == DA07RazorTriggerREF) && (asEventName == "Done")
; 		debug.Trace(self + "playing Take animation")
		Self.PlayAnimation("Take")
		Game.GetPlayer().AddItem(DA07MehrunesRazor, 1)
		DA07.SetStage(100)
		UnregisterForAnimationEvent(self, "Done")
	EndIf
EndEvent