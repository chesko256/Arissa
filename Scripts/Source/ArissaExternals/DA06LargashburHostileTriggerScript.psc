Scriptname DA06LargashburHostileTriggerScript extends ObjectReference  

Quest Property DA06  Auto  

Faction Property TownLargashburFaction  Auto  

Faction Property PlayerFaction  Auto

Event OnTriggerEnter (ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
; 			Debug.Trace("Entered hostile trigger")
		if DA06.IsRunning() == 0
; 			Debug.Trace("Faction set enemy")
			TownLargashburFaction.SetEnemy(PlayerFaction)
		else
; 			Debug.Trace("No Faction Change")
			Self.Disable()
		endif
	endif

EndEvent