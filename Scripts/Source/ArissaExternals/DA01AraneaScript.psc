ScriptName DA01AraneaScript extends ReferenceAlias

Location Property pShrineofAzura auto
ObjectReference Property pShrineofAzuraMarker auto

Event OnUnload()

	;if the Aranea is moving to the Shrine of Azura, teleport her there on unload
	If (GetOwningQuest().GetStageDone(55) == 1) && (pShrineofAzura != Self.GetActorRef().GetCurrentLocation())
		Self.GetActorRef().MoveTo(pShrineofAzuraMarker)
	EndIf
	
EndEvent