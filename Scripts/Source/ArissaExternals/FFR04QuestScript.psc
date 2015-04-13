Scriptname FFR04QuestScript extends Quest  

Quest Property pFFR04Quest Auto Conditional
GlobalVariable Property pFFR04NirnCount Auto Conditional
GlobalVariable Property pFFR04NightshadeCount Auto Conditional
GlobalVariable Property pFFR04DeathbellCount Auto Conditional
Ingredient Property pNirnroot Auto Conditional
Ingredient Property pNightshade Auto Conditional
Ingredient Property pDeathbell Auto Conditional

Function Nirncount()

	float CurrentCount = Game.GetPlayer().GetItemCount(pNirnroot)

	pFFR04NirnCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFR04NirnCount)
	if CurrentCount >= 20
		pFFR04Quest.SetObjectiveCompleted(10,1)
		pFFR04Quest.SetObjectiveDisplayed(15,true,true)
	elseif CurrentCount < 20
		pFFR04Quest.SetObjectiveCompleted(10,0)
		pFFR04Quest.SetObjectiveDisplayed(15,0)
		pFFR04Quest.SetObjectiveDisplayed(10,true,true)	
	endif

endFunction

Function NightshadeCount()

	float CurrentCount = Game.GetPlayer().GetItemCount(pNightshade)

	pFFR04NightshadeCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFR04NightshadeCount)
	if CurrentCount >= 20
		pFFR04Quest.SetObjectiveCompleted(20,1)
		pFFR04Quest.SetObjectiveDisplayed(25,true,true)
	elseif CurrentCount < 20
		pFFR04Quest.SetObjectiveCompleted(20,0)
		pFFR04Quest.SetObjectiveDisplayed(25,0)
		pFFR04Quest.SetObjectiveDisplayed(20,true,true)	
	endif

endFunction

Function DeathbellCount()

	float CurrentCount = Game.GetPlayer().GetItemCount(pDeathbell)

	pFFR04DeathbellCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFR04DeathbellCount)
	if CurrentCount >= 20
		pFFR04Quest.SetObjectiveCompleted(30,1)
		pFFR04Quest.SetObjectiveDisplayed(35,true,true)
	elseif CurrentCount < 20
		pFFR04Quest.SetObjectiveCompleted(30,0)
		pFFR04Quest.SetObjectiveDisplayed(35,0)
		pFFR04Quest.SetObjectiveDisplayed(30,true,true)	
	endif

endFunction