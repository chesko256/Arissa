Scriptname C06YsgramorStatueScript extends ObjectReference  

Weapon Property BladeOfYsgramor auto
ObjectReference Property BladeInstance auto
Quest Property C06 auto
ObjectReference Property TombDoor auto

auto State NoBlade
	Event OnBeginState()
		BladeInstance.Disable()
		;;TombDoor.Activate(Game.GetPlayer())
		TombDoor.Enable(true)
	EndEvent

	Event OnActivate(ObjectReference akActivator)
		if (Game.GetPlayer() == akActivator)
			if (Game.GetPlayer().GetItemCount(BladeOfYsgramor) > 0)
				NorPortcullisSCRIPT doorScript = TombDoor as NorPortcullisSCRIPT
				;;if (doorScript.isAlreadyOpen || doorScript.isOpening)
				if (TombDoor.IsDisabled())
					return
				endif
				Game.GetPlayer().RemoveItem(BladeOfYsgramor, 1)
				if (C06.IsRunning() && C06.GetStageDone(40) == False)
					C06.SetStage(40)
				endif
				GoToState("Blade")
			endif
		endif
	EndEvent
EndState

State Blade
	Event OnBeginState()
		BladeInstance.Enable()
		TombDoor.PlayAnimation("open")
		Utility.Wait(10)
		TombDoor.Disable(true)
	EndEvent
	
	Event OnActivate(ObjectReference akActivator)
		if (Game.GetPlayer() == akActivator)
			; NorPortcullisSCRIPT doorScript = TombDoor as NorPortcullisSCRIPT
			; if (!doorScript.isAlreadyOpen || doorScript.isClosing)
			; if (TombDoor.IsEnabled())
				; return
			; endif
			Game.GetPlayer().AddItem(BladeOfYsgramor, 1)
			GoToState("Done") ; forget it, don't close the door once it's been opened
		endif
	EndEvent
EndState

State Done
	Event OnBeginState()
		BladeInstance.Disable()
	EndEvent
EndState