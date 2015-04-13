Scriptname MS14AlvaScript extends ReferenceAlias  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akNewLoc == AlvasHouse
		Alva.GetActorRef().SetCrimeFaction(none)
		Hroggar.GetActorRef().SetCrimeFaction(none)
	Else
		Alva.GetActorRef().SetCrimeFaction(CrimeFaction)
		Hroggar.GetActorRef().SetCrimeFaction(CrimeFaction)
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
    If GetOwningQuest().GetStage() == 80
        GetOwningQuest().SetStage(90)
    EndIf
    GetRef().UnregisterForUpdate()
EndEvent

location Property AlvasHouse  Auto  

ReferenceAlias Property Alva  Auto  

Faction Property CrimeFaction  Auto  

ReferenceAlias Property Hroggar  Auto  
