Scriptname DA16ErandurScript extends ReferenceAlias  Conditional

Quest Property pDA16Quest  Auto
GlobalVariable Property pDA16ErandurDead Auto Conditional

Event OnDeath(Actor akKiller)
	
	if akKiller == Game.GetPlayer()
		if pDA16Quest.getstage() == 197
			pDA16ErandurDead.Value = 1
			pDA16Quest.setstage(199)
		elseif pDA16Quest.getstage() == 198
			pDA16ErandurDead.Value = 1
			pDA16Quest.SetObjectiveDisplayed(180,0)
			pDA16Quest.SetObjectiveCompleted(170,1)
			pDA16Quest.SetStage(200)
		endif
	endif

endEvent