Scriptname FFR06QuestScript extends Quest  Conditional

MiscObject Property pGem Auto Conditional
GlobalVariable Property pFFR06Count Auto Conditional
GlobalVariable Property pFFR06Total Auto Conditional
Quest Property pFFR06Quest Auto Conditional

Function GemsCounted()

	float CurrentCount = Game.GetPlayer().GetItemCount(pGem)

	pFFR06Count.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFR06Count)
	if CurrentCount == 3
		pFFR06Quest.SetObjectiveCompleted(10,1)
		pFFR06Quest.SetObjectiveDisplayed(20,true,true)
	elseif CurrentCount < 3
		pFFR06Quest.SetObjectiveCompleted(10,0)
		pFFR06Quest.SetObjectiveDisplayed(20,0)
		pFFR06Quest.SetObjectiveDisplayed(10,true,true)	
	endif

endFunction
