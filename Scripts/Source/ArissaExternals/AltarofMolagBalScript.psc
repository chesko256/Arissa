ScriptName AltarofMolagBalScript extends ReferenceAlias

ReferenceAlias Property MaceofMolagBal Auto
Quest Property DA10 Auto

ReferenceAlias Property TalkingMaceTriggerREF Auto
ReferenceAlias Property TalkingMace Auto
ReferenceAlias Property RustyMaceIntRef Auto
Int Property DisableOnce Auto

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

; 	debug.trace(self + "Receiving animation event from player")
	If akSource == Game.GetPlayer() && asEventName == "IdleChairSitting"
		;Utility.Wait(1)
		Game.DisablePlayerControls()
		GetRef().PlayAnimation("Up")
		TalkingMace.GetRef().Activate(Game.GetPlayer())
		TalkingMaceTriggerREF.GetRef().Disable()
		UnRegisterForAnimationEvent(Game.GetPlayer(), "IdleChairSitting")
	EndIf

EndEvent

Event OnActivate(ObjectReference akActionRef)

	If (akActionRef == (Game.GetPlayer())) && (GetOwningQuest().GetStageDone(76) == 0)
		RegisterForAnimationEvent(Game.GetPlayer(), "IdleChairSitting")
		;Game.ForceThirdPerson()
		
		;failsafe
		Utility.Wait(5)
		UnRegisterForAnimationEvent(Game.GetPlayer(), "IdleChairSitting")
	EndIf
		
EndEvent