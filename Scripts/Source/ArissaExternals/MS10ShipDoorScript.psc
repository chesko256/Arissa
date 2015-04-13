Scriptname MS10ShipDoorScript extends ReferenceAlias  

Message Property SureYouWantTo auto

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (GetOwningQuest().GetStage() == 41)
			int response = SureYouWantTo.Show()
			if (response == 0)
				(GetOwningQuest() as MS10QuestScript).SetSail()
			endif
		endif
	endif
EndEvent
