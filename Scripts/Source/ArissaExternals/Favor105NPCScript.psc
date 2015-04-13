ScriptName Favor105NPCScript extends ReferenceAlias

LocationAlias Property FavorLocation Auto
ReferenceAlias Property EdgeMarker Auto

Event OnUnload()

	;If this is stage 10, move the questgiver to the den
	If GetOwningQuest().GetStage() == 10
		Self.GetActorRef().Moveto(EdgeMarker.GetRef())
		GetOwningQuest().SetStage(12)
	EndIf

EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	If (GetOwningQuest().GetStage() == 20) && (akNewLoc == FavorLocation.GetLocation())
		GetOwningQuest().SetStage(200)
	EndIf

EndEvent