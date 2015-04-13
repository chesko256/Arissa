Scriptname CR12TotemSlotScript extends ObjectReference  

Quest Property CR12 auto
ObjectReference Property TotemTarget auto

Event OnActivate(ObjectReference akActivator)
	if (CR12.GetStage() == 20)
		TotemTarget.Enable()
		TotemTarget.SetMotionType(Motion_Keyframed)
		CR12.SetStage(100)
		Disable()
	endif
EndEvent
