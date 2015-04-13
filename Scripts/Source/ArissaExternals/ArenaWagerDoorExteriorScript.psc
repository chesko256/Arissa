Scriptname ArenaWagerDoorExteriorScript extends ReferenceAlias

Message Property ArenaWagerDoorMessage auto
ObjectReference Property InsideMarker auto

Function Setup()
    GetReference().BlockActivation()
EndFunction

Event OnActivate(ObjectReference akActivator)
    if (akActivator == Game.GetPlayer())
        ArenaScript arenaLogic = (GetOwningQuest() as ArenaScript)
        if ( arenaLogic.WagerOngoing && !arenaLogic.WagerResolutionRequired )
            arenaLogic.StartWagerFight()
            Game.GetPlayer().MoveTo(InsideMarker)
        else
            ArenaWagerDoorMessage.Show()
        endif
    endif
EndEvent