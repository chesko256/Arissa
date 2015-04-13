Scriptname FFI03QuestScript extends Quest  Conditional

FormList Property pFFI03FormList Auto Conditional
GlobalVariable Property pFFI03BearCount Auto Conditional
GlobalVariable Property pFFI03BearTotal Auto Conditional
Quest Property pFFI03Quest Auto Conditional
LeveledItem Property pFFI03Axe Auto Conditional
MiscObject Property BearSnowPelt Auto
MiscObject Property BearCavePelt Auto
MiscObject Property BearPelt Auto

Function PeltsCounted()

	float CurrentCount = Game.GetPlayer().GetItemCount(pFFI03FormList)

	pFFI03BearCount.Value = CurrentCount
	UpdateCurrentInstanceGlobal(pFFI03BearCount)
	if CurrentCount >= 10
		pFFI03Quest.SetObjectiveCompleted(10,1)
		pFFI03Quest.SetObjectiveDisplayed(20,true,true)
	elseif CurrentCount < 10
		pFFI03Quest.SetObjectiveCompleted(10,0)
		pFFI03Quest.SetObjectiveDisplayed(20,0)
		pFFI03Quest.SetObjectiveDisplayed(10,true,true)	
	endif

endFunction

Function EndSwap()

	int ListSize = pFFI03FormList.GetSize()
	int CurrentPelts = 0
	int PeltsLeft = 10

	while CurrentPelts < ListSize && PeltsLeft > 0
		Form CurrentItem = pFFI03FormList.GetAt(CurrentPelts)
		int PeltCount = Game.GetPlayer().GetItemCount(CurrentItem)
		if PeltCount >= PeltsLeft
			PeltsLeft = 0
		else
			PeltsLeft -= PeltCount
		endif

		Game.GetPlayer().RemoveItem(CurrentItem,PeltCount)
		CurrentPelts += 1
	endwhile

	Game.GetPlayer().AddItem(pFFI03Axe,1)

endFunction