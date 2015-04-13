Scriptname FFSareth01QuestScript extends Quest  Conditional

Ingredient Property pFFS01Jazbay Auto Conditional
GlobalVariable Property pFFS01Count Auto Conditional
GlobalVariable Property pFFS01Total Auto Conditional
Quest Property pFFS01Quest Auto Conditional
LeveledItem Property pFFS01Potions Auto Conditional

Function GrapesCounted()

	float CurrentCount = Game.GetPlayer().GetItemCount(pFFS01Jazbay)

	if pFFS01Quest.GetStage() < 30
	pFFS01Count.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFS01Count)
	SetObjectiveDisplayed(10,true,true)
		if CurrentCount >= 20
			pFFS01Quest.SetStage(30)
		endif	
	endif

endFunction


Function EndSwap()

	Game.GetPlayer().RemoveItem(pFFS01Jazbay,20)
	Game.GetPlayer().AddItem(pFFS01Potions)
	Game.GetPlayer().AddItem(pFFS01Potions)
	Game.GetPlayer().AddItem(pFFS01Potions)
	Game.GetPlayer().AddItem(pFFS01Potions)
	Game.GetPlayer().AddItem(pFFS01Potions)

endFunction