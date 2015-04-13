Scriptname TG04EECDoorScript extends ObjectReference  Conditional

ObjectReference Property pImperialHasCity Auto
Quest Property pTG04Quest Auto
Quest Property pTG04EECQuest Auto

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG04Quest.IsRunning() == 0
			if pImperialHasCity.IsDisabled() == 0
				pTG04EECQuest.SetStage(10)
			elseif pImperialHasCity.IsDisabled() == 1
				pTG04EECQuest.SetStage(20)
			endif			
		elseif pTG04Quest.IsRunning() == 1
			pTG04EECQuest.SetStage(30)
		endif
	endif

endEvent