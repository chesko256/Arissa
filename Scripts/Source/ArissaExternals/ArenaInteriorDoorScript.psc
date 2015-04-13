Scriptname ArenaInteriorDoorScript extends ReferenceAlias  

ObjectReference Property OutsideMarker auto

Function Setup()
    GetReference().BlockActivation()
EndFunction

Event OnActivate(ObjectReference akActivator)
;     Debug.Trace("ARENA: Interior door activation.")
	if (akActivator == Game.GetPlayer())
		if ((GetOwningQuest() as ArenaScript).CombatOngoing)
; 			Debug.Trace("ARENA: Moving player outside.")
			GetReference().Lock(true)
            Game.GetPlayer().MoveTo(OutsideMarker)
        else
            Game.GetPlayer().Activate(akActivator)
		endif
    else
        GetReference().Activate(akActivator)
	endif
EndEvent
