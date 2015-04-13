Scriptname FFR10QuestScript extends Quest  Conditional

GlobalVariable Property pFF10SaltCount Auto Conditional
Quest Property pFFR10Quest Auto Conditional
Ingredient Property pSalt Auto Conditional

Function SaltCounted()

	float CurrentCount = Game.GetPlayer().GetItemCount(pSalt)

	pFF10SaltCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFF10SaltCount)
	if CurrentCount >= 10
		pFFR10Quest.SetObjectiveCompleted(10,1)
		pFFR10Quest.SetObjectiveDisplayed(20,true,true)
	elseif CurrentCount < 10
		pFFR10Quest.SetObjectiveCompleted(10,0)
		pFFR10Quest.SetObjectiveDisplayed(20,0)
		pFFR10Quest.SetObjectiveDisplayed(10,true,true)	
	endif

endFunction