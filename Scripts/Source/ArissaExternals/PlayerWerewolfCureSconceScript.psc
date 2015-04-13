Scriptname PlayerWerewolfCureSconceScript extends ReferenceAlias  

MiscObject Property WitchHead auto
ReferenceAlias Property WolfSpirit auto
Message Property CureMessage auto

; 77524 
Quest Property CR12 auto
; /77524 
Quest Property CR13 auto
Quest Property C06 auto

auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		; 77524 -- CR13 and CR12 checks
		if ((CR13 as CompanionsRadiantQuest).IsAccepted || (CR12 as CompanionsRadiantQuest).IsAccepted || C06.IsRunning())
			return
		endif

		if (Game.GetPlayer() == akActivator)
			if (Game.GetPlayer().GetItemCount(WitchHead) > 0)
				int choice = -1 
				choice = CureMessage.Show()
				if (choice == 0)
					GoToState("Done")
					Game.GetPlayer().RemoveItem(WitchHead, 1)
					WolfSpirit.GetReference().Enable()
					; 77524 
					if (CR12.IsRunning())
						Debug.Trace("Werewolf Cure: CR12 is no longer valid; shutting down.")
						(CR12 as CompanionsRadiantQuest).IsAccepted = false
						(CR12 as CompanionsRadiantQuest).Premature = true
						((CR12 as CompanionsRadiantQuest).ParentQuest as CompanionsHousekeepingScript).CycleRadiantQuests()
					endif
					; /77524 
				endif
			endif
		endif
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
	EndEvent
EndState

; to allow existing saves to work before the Waiting/Done states were added
Event OnActivate(ObjectReference akActivator)
	GoToState("Waiting")
	GetReference().Activate(akActivator)
EndEvent
