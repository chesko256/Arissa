Scriptname MQ102FriendScript extends ReferenceAlias  

Scene Property TravelToRiverwoodScene  Auto  
{scene to stop if you start combat with friend}


Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if (akTarget == Game.GetPlayer())
		if (aeCombatState > 0)
			; stop to Riverwood scene if you're fighting him
			if TravelToRiverwoodScene.IsPlaying()
				TravelToRiverwoodScene.Stop()
			endif
		endif
	endif
endEvent
