Scriptname CWEscapeCity extends CWMissionScript  
{Extend CWMissionScript which extends Quest}

LocationAlias Property City Auto


;OBSOLETE - handled by CWSiegePollPlayerLocation.psc

;Event OnUpdate()
;	if Game.GetPlayer().IsInLocation(City.GetLocation()) == False
;		Stop()
;	
;	EndIf
;
;EndEvent
