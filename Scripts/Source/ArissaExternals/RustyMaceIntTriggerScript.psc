ScriptName RustyMaceIntTriggerScript extends ReferenceAlias

ReferenceAlias Property TalkingMace Auto

Event OnActivate(ObjectReference akActionRef)

	If (akActionRef == Game.GetPlayer())
		TalkingMace.GetRef().Activate(Game.GetPlayer())
	EndIf
	
EndEvent