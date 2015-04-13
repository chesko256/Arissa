Scriptname MG06CrystalTriggerScript extends ObjectReference  

Event OnActivate(ObjectReference TriggerRef)
	if MG06.GetStage() == 40
		if TriggerRef == Game.GetPlayer()

			MG06ArmillaryScript ArmillaryScript = ArmillaryRef as MG06ArmillaryScript

			if ArmillaryScript.ReadyForSpells == 0
				ArmillaryRef.GoToState("busy")
				MG06.SetStage(50)
				Game.GetPlayer().RemoveItem(MG06Crystal.GetReference(), 1)
				ArmillaryRef.PlayAnimationandWait("Engage", "TransSeq01")
				ArmillaryScript.ReadyForSpells = 1
				ArmillaryRef.GoToState("Position01")
				ArmillaryScript.Positionvar = 1
				(Button01 as MG06ButtonScript).Open()
				(Button02 as MG06ButtonScript).Open()
				(Button03 as MG06ButtonScript).Open()
			endif
		endif
	endif

EndEvent



Quest Property MG06 Auto

ObjectReference Property ArmillaryRef Auto


ObjectReference Property Button01  Auto  

ObjectReference Property Button02  Auto  

ObjectReference Property Button03  Auto  

ReferenceAlias Property MG06Crystal Auto