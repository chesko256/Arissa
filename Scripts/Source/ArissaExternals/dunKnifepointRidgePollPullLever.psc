ScriptName dunKnifepointRidgePollPullLever extends objectReference

ObjectReference property Lever Auto

Event onTrigger(objectReference triggerRef)
	if (!Self.IsDisabled() && !(triggerRef As Actor).IsDead() && triggerRef != Game.GetPlayer() && (triggerRef as Actor).IsInCombat())
		Lever.Activate(Self)
		(triggerRef As Actor).SetAV("Variable06", 1)
		Self.Disable()
	EndIf
EndEvent

Event OnReset()
	Self.Enable()
EndEvent