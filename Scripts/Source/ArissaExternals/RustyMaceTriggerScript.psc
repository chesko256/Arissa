ScriptName RustyMaceTriggerScript extends ReferenceAlias

ReferenceAlias Property Altar Auto
ReferenceAlias Property TalkingMace Auto
ReferenceAlias Property RustyMaceIntRef Auto

Event OnActivate(ObjectReference akActionRef)

	If (akActionRef == (Game.GetPlayer())) && (GetOwningQuest().GetStageDone(76) == 0)
		Altar.GetRef().Activate(Game.GetPlayer())
		;Game.ForceThirdPerson()
		;Game.DisablePlayerControls()
		;Altar.GetRef().PlayAnimation("Up")
		;TalkingMace.GetRef().Activate(Game.GetPlayer())
		;RustyMaceIntRef.GetRef().Enable()
		;Self.GetRef().Disable()
	EndIf
		
EndEvent