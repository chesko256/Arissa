Scriptname TG03MeadReserveBarrelScript extends ObjectReference  Conditional

Quest Property pTG03Quest  Auto
Message Property pTG03BarrelMessage Auto


Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG03Quest.GetStageDone(80) == 1
			pTG03Quest.SetStage(90)
		elseif pTG03Quest.GetStageDone(80) == 0
			pTG03BarrelMessage.Show()
		endif
	endif

endEvent
