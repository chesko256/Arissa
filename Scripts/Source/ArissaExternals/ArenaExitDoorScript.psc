Scriptname ArenaExitDoorScript extends ReferenceAlias

Location Property PitLocation auto
Message Property ArenaNobodyLeavesMessage auto

ObjectReference Property BloodworksDoorMarker auto

Function Setup()
	GetReference().BlockActivation()
EndFunction

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		return
	endif

	ArenaScript arScript = GetOwningQuest() as ArenaScript
	if (Game.GetPlayer().GetCurrentLocation() == PitLocation)
		if (arScript.CombatOngoing)
			ArenaNobodyLeavesMessage.Show()
		else
			; GetReference().Activate(akActionRef, true)
			Game.GetPlayer().MoveTo(BloodworksDoorMarker)
		endif
	endif
EndEvent
