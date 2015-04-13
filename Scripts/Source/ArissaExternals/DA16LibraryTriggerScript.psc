Scriptname DA16LibraryTriggerScript extends ObjectReference  Conditional

Quest Property pDA16Quest  Auto  Conditional
ObjectReference Property pErandur Auto Conditional

Event OnTriggerEnter(ObjectReference akActionRef)

	if (Game.GetPlayer() as Actor).IsInCombat() == 0 &&  (pErandur as Actor).IsInCombat() == 0
		if akActionRef == Game.GetPlayer()
			if pDA16Quest.GetStage() == 50
				pDA16Quest.SetStage(60)
			endif
		endif
	endif

endEvent