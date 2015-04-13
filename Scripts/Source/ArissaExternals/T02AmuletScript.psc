Scriptname T02AmuletScript extends ReferenceAlias  


ReferenceAlias Property Ruki auto
ReferenceAlias Property Fenrig auto


Event OnEquipped(Actor akActor)
; 	Debug.Trace("T02: Donning amulet.")
	if (GetOwningQuest().GetStageDone(100))
		return ; we don't care about this anymore
	endif

	Utility.Wait(0.1) ; just to hold until we get out of menu mode

	GetOwningQuest().SetObjectiveCompleted(75, 1)

	if     ( !GetOwningQuest().GetStageDone(90) )
		; seeking Ruki
		GetOwningQuest().SetObjectiveDisplayed(80)
	elseif ( !GetOwningQuest().GetStageDone(95) )
		; looking for Fenrig
		GetOwningQuest().SetObjectiveDisplayed(90)
	else
		; back to Ruki
		GetOwningQuest().SetObjectiveDisplayed(95)
	endif

	Utility.Wait(1.0)

	Ruki.GetActorReference().Enable(true)

	if (GetOwningQuest().GetStage() != 95 )
		Fenrig.GetActorReference().Enable(true)
	endif

EndEvent

Event OnUnequipped(Actor akActor)
; 	Debug.Trace("T02: Removing amulet.")
	if (GetOwningQuest().GetStageDone(100))
		return ; we don't care about this anymore
	endif

	Utility.Wait(0.1) ; just to hold until we get out of menu mode

	GetOwningQuest().SetObjectiveCompleted(75, 0)
	GetOwningQuest().SetObjectiveDisplayed(75, 1, 1)

	if     ( !GetOwningQuest().GetStageDone(90) )
		; seeking Ruki
		GetOwningQuest().SetObjectiveDisplayed(80, 0)
	elseif ( !GetOwningQuest().GetStageDone(95) )
		; looking for Fenrig
		GetOwningQuest().SetObjectiveDisplayed(90, 0)
	else
		; back to Ruki
		GetOwningQuest().SetObjectiveDisplayed(95, 0)
	endif

	Utility.Wait(1.0)

	Ruki.GetActorReference().Disable(true)

	if (GetOwningQuest().GetStage() != 95 )
		Fenrig.GetActorReference().Disable(true)
	endif
EndEvent
