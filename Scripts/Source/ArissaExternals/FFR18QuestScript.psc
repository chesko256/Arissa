Scriptname FFR18QuestScript extends Quest  Conditional

MiscObject Property pTusk Auto Conditional
MiscObject Property pGem Auto Conditional
MiscObject Property pOre Auto Conditional
GlobalVariable Property pFFR18GemCount Auto Conditional
GlobalVariable Property pFFR18TuskCount Auto Conditional
GlobalVariable Property pFFR18OreCount Auto Conditional
Quest Property pFFR18Quest Auto Conditional

Function GemCounted()

	float CurrentCount = Game.GetPlayer().GetItemCount(pGem)

	pFFR18GemCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFR18GemCount)
	if CurrentCount >= 2
		pFFR18Quest.SetObjectiveCompleted(10,1)
		pFFR18Quest.SetObjectiveDisplayed(15,true,true)
	elseif CurrentCount < 2
		pFFR18Quest.SetObjectiveCompleted(10,0)
		pFFR18Quest.SetObjectiveDisplayed(15,0)
		pFFR18Quest.SetObjectiveDisplayed(10,true,true)	
	endif

endFunction

Function TuskCounted()

	float CurrentCount = Game.GetPlayer().GetItemCount(pTusk)

	pFFR18TuskCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFR18TuskCount)
	if CurrentCount >= 1
		pFFR18Quest.SetObjectiveCompleted(20,1)
		pFFR18Quest.SetObjectiveDisplayed(25,true,true)
	elseif CurrentCount < 1
		pFFR18Quest.SetObjectiveCompleted(20,0)
		pFFR18Quest.SetObjectiveDisplayed(25,0)
		pFFR18Quest.SetObjectiveDisplayed(20,true,true)	
	endif

endFunction

Function OreCounted()

	float CurrentCount = Game.GetPlayer().GetItemCount(pOre)

	pFFR18OreCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFR18OreCount)
	if CurrentCount >= 1
		pFFR18Quest.SetObjectiveCompleted(30,1)
		pFFR18Quest.SetObjectiveDisplayed(35,true,true)
	elseif CurrentCount < 1
		pFFR18Quest.SetObjectiveCompleted(30,0)
		pFFR18Quest.SetObjectiveDisplayed(35,0)
		pFFR18Quest.SetObjectiveDisplayed(30,true,true)	
	endif

endFunction