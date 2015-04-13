Scriptname C01ObserverScript extends ReferenceAlias  

Race Property WerewolfBeastRace auto

Event OnRaceSwitchComplete()
	if (GetActorReference().GetRace() == WerewolfBeastRace)
; 	    Debug.Trace("WEREWOLF: Getting notification that race swap is complete.")
    	GetActorReference().UnequipAll()
    endif
EndEvent

