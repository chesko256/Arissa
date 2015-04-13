Scriptname NN01QuestScript extends Quest  Conditional

GlobalVariable Property pNN01Count Auto Conditional
int Property pNNTold01 Auto Conditional
ObjectReference Property pSarethiFarmMapMarker Auto
Function GotARoot()

	if GetStage() == 10
		SetStage(15)
		pNN01Count.Value += 1
	elseif GetStage() == 15
		pNN01Count.Value += 1		
	elseif GetStage() == 20
		if pNN01Count.Value < 30
			ModObjectiveGlobal(1, pNN01Count, 10)
		elseif pNN01Count.Value >= 30
			pNN01Count.Value += 1	
		endif		
	endif

	if pNN01Count.Value >= 30
		SetObjectiveCompleted(10,1)
		SetObjectiveDisplayed(20,1)
		pSarethiFarmMapMarker.AddToMap()
	endif

endFunction

Function LostARoot()

	if GetStage() < 20
		pNN01Count.Value -= 1		
	elseif GetStage() == 20
		if pNN01Count.Value < 30
			ModObjectiveGlobal(-1, pNN01Count, 10)
		elseif pNN01Count.Value >= 30
			pNN01Count.Value -= 1
		endif				
	endif

	if IsObjectiveDisplayed(20) == 1
		SetObjectiveCompleted(10,0)
		SetObjectiveDisplayed(20,0)
		SetObjectiveDisplayed(10,1)
	endif

endFunction