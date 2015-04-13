ScriptName dunRobbersGorge_PollPullLever extends objectReference

Event onTrigger(objectReference triggerRef)
; 	;Debug.Trace("ONTRIGGER: " + Self + " " + triggerRef + " " + (triggerRef As Actor).GetActorValue("Variable06"))
	if (!Self.IsDisabled() && triggerRef != Game.GetPlayer() && !(triggerRef As Actor).IsDead() && (triggerRef As Actor).GetActorValue("Variable06") > 0)
		Self.GetLinkedRef().Activate(Self)
		Self.Disable()
		(triggerRef as Actor).EvaluatePackage()
	EndIf
EndEvent

Event OnReset()
	Self.Enable()
EndEvent