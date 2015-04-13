Scriptname CompanionsStoryQuest extends Quest

Quest Property CentralQuest auto
CompanionsStoryQuest Property PreviousQuest auto
CompanionsStoryQuest Property NextQuest auto

; called when we're testing the quest and want to create its preconditions 
;  note that stage 1 will be set at the end of it
Function Setup()
; 	Debug.Trace("CSQ: Calling setup for " + self)

	CompanionsHousekeepingScript chs = (CentralQuest as CompanionsHousekeepingScript)
	
	if (PreviousQuest != None)
		if (PreviousQuest.IsRunning() == false)
			if (PreviousQuest.GetStageDone(1) == false)
				PreviousQuest.SetStage(0)
			endif
; 			Debug.Trace("CSQ: Setting stage 200 on " + PreviousQuest)
			PreviousQuest.SetStage(200)
		endif
	endif
	
	; Game.GetPlayer().AddToFaction(chs.CompanionsFaction)
	if (!CentralQuest.GetStageDone(150))
		if (!CentralQuest.GetStageDone(100))
			CentralQuest.SetStage(100)
		endif
		CentralQuest.SetStage(150)
		CentralQuest.CompleteQuest()
	endif
	chs.StartStoryQuest(self) ; sets stage 1
EndFunction

; called at stage 1 to do any real setup
Function Init()
; 	Debug.Trace("CSQ: Calling init for " + self)
EndFunction

; called with stage 200 to do any necessary teardown (de-essentializing people, etc.)
Function Teardown()
; 	Debug.Trace("CSQ: Calling teardown for " + self)
EndFunction
