Scriptname CWMapQuestScript extends Quest  Conditional

CWScript Property CWs Auto


ReferenceAlias Property WhiterunFlag Auto
ReferenceAlias Property WhiterunMapMarker Auto

ReferenceAlias Property RiverwoodFlag Auto
ReferenceAlias Property RiverwoodMapMarker Auto

Function SetFlagAlias(ObjectReference FlagReference, Location LocationToSetFlagAliasFor)
	GetAliasForLocation(LocationToSetFlagAliasFor).ForceRefTo(FlagReference)
EndFunction

function AddToMapForLocation(Location LocationToToggleMapMarkerOnFor)
	debug.Notification("AddToMap() is not popping a message telling you this location has been added to your map.")
	GetMapMarkerForLocation(LocationToToggleMapMarkerOnFor).AddToMap()
EndFunction


ReferenceAlias function GetAliasForLocation (Location LocationToGetFor)
	if LocationToGetFor == CWs.WhiterunLocation
		return WhiterunFlag
	elseif LocationToGetFor == CWs.RiverwoodLocation
		return RiverwoodFlag
	EndIf
EndFunction

ObjectReference function GetMapMarkerForLocation (Location LocationToGetFor)
	if LocationToGetFor == CWs.WhiterunLocation
		return WhiterunMapMarker.GetReference()
	elseif LocationToGetFor == CWs.RiverwoodLocation
		return RiverwoodMapMarker.GetReference()
		
	EndIf
EndFunction

