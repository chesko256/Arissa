Scriptname CWSiegeWhiterunCityDoorSCRIPT extends ObjectReference Hidden 
{Handles the Whiterun City Door during the siege.}

;***OBSOLETE SCRIPT***

Quest Property CWSiegeWhiterunAttackQST Auto
Quest Property CWAttackCity Auto	;this is the quest that puts everyone in their houses handles getting the Jarl to surrender, etc.

Message Property CWDoorMessage Auto		;pointer to message to show when activating the door (whiterun = CWSiegeWhiterunDoorMsg)


EVENT onActivate (objectReference triggerRef)

	if (CWSiegeWhiterunAttackQST.IsRunning())		

		if (CWSiegeWhiterunAttackQST.GetStage() < 50)
			CWDoorMessage.show()
			
		elseif (CWSiegeWhiterunAttackQST.GetStage() == 50)
			if (triggerRef == game.GetPlayer())
				CWSiegeWhiterunAttackQST.SetStage(60)
				CWAttackCity.start()
				
				
			endif
		endif
		

		
	else
		;Do Nothing
	endif
	
EndEvent
