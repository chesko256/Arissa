Scriptname WordWallListenerQuestScript extends Quest  

;see also WordWallTriggerScript

;jduvall, please see me before making changes to this script.

;used in the follow quests:
;WICastMagic04
;XXX


ReferenceAlias Property LocRefMarkerAlias Auto
{The alias in this quest, that is filled with an xmarker with LocationWordWall location ref type}

int	Property StageToSet Auto
{Stage to set when word wall associated with LocRefMarkerAlias causes the player to learn the word}


function CheckLocRefMarker(ObjectReference WordWallTriggerScriptsMyLocRefMarker)
{Called by WordWallTriggerScript}

; 	debug.trace(self + "CheckLocRefMarker(" + WordWallTriggerScriptsMyLocRefMarker + ")")
	
	if WordWallTriggerScriptsMyLocRefMarker == LocRefMarkerAlias.GetReference()
; 		debug.trace(self + "CheckLocRefMarker(" + WordWallTriggerScriptsMyLocRefMarker + ") MATCH! Setting stage " + StageToSet)
		SetStage(StageToSet)
		
	Else
; 		debug.trace(self + "CheckLocRefMarker(" + WordWallTriggerScriptsMyLocRefMarker + ") NOT A MATCH. NOT setting stage " + StageToSet)
		
	EndIf


EndFunction

