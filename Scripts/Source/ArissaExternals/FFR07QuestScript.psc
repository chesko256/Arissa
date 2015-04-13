Scriptname FFR07QuestScript extends Quest  

GlobalVariable Property pFFR07TeethCount Auto Conditional
Quest Property pFFR07Quest Auto Conditional
Ingredient Property pTeeth Auto

Function TeethCounted()

	float CurrentCount = Game.GetPlayer().GetItemCount(pTeeth)

	pFFR07TeethCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFR07TeethCount)
	if CurrentCount >= 5
		pFFR07Quest.SetObjectiveCompleted(10,1)
		pFFR07Quest.SetObjectiveDisplayed(20,true,true)
	elseif CurrentCount < 5
		pFFR07Quest.SetObjectiveCompleted(10,0)
		pFFR07Quest.SetObjectiveDisplayed(20,0)
		pFFR07Quest.SetObjectiveDisplayed(10,true,true)	
	endif

endFunction