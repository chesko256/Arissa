Scriptname MQ102PlayerScript extends ReferenceAlias  

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	MQ102QuestScript myQuest = (GetOwningQuest() as MQ102QuestScript)

	; clean up MQ101 when player leaves Helgen
	if myQuest.getStageDone(30) == 0
		if (Game.GetPlayer().IsInLocation( myQuest.Helgen ) == 0)
			myQuest.setstage (30)
		endif
	endif

	; trigger Riverwood scene when player arrives with Hadvar
	if myQuest.getStageDone(35) == 0
		if myQuest.Riverwood == akNewLoc
			myQuest.setstage (35)
		endif
	endif

	; advance Riverwood scene when player goes inside
	if myQuest.getStageDone(40) == 1 && myQuest.getStageDone(45) == 0
		if myQuest.RiverwoodFriendHouse == akNewLoc
			myQuest.setstage (45)
		endif
	endif

	; turn on Civil War if player leaves/ignores Riverwood
	; THIS MAY BE OBSOLETE
	if myQuest.getStageDone(55) == 0 && myQuest.GetStage() >= 50
		if (Game.GetPlayer().IsInLocation( myQuest.Riverwood ) == 0)
			myQuest.setstage (55)
		endif
	endif

	; move actors into position when player enters Dragonsreach
	if myQuest.MQ102.getstageDone(75) == 0
		if myQuest.Dragonsreach == akNewLoc
			myQuest.MQ102.setstage (75)
		endif
	endif

	; update Riverwood scenes if player enters Windhelm or Solitude - need to let that finish to Ralof/Hadvar is available for Korvanjund
	if myQuest.GetStageDone(35) == 0
		if akNewLoc == myQuest.WindhelmLocation || akNewLoc == myQuest.SolitudeLocation
			myQuest.SetStage(35)
		endif
	endif
endEvent
