ScriptName FavorScoutingScript extends Quest

ReferenceAlias Property MapMarker Auto

Event OnUpdate()

	If (GetStage() == 10) && (MapMarker.GetRef().CanFastTravelToMarker() == True)
		SetStage(15)
		UnregisterforUpdate()
	EndIf

EndEvent