Scriptname PlayerHorseScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	MySelf = GetActorReference()
EndEvent

Event OnUnload()
	If MySelf.IsDead() == 1
		; disable the dead horse if it is unloaded
		MySelf.Disable()
		MySelf.Delete()
		; added a new horse that can be bought at the stables
		Myself = StablesPosition.PlaceActorAtMe(LvlHorseSaddled)
		Alias_HorseRef.ForceRefTo(MySelf)
		Alias_HorseRef.GetRef().SetFactionOwner(StablesFaction)
	EndIf
EndEvent


Actor Property MySelf  Auto  

ObjectReference Property StablesPosition  Auto  

ActorBase Property LvlHorseSaddled  Auto  

ReferenceAlias Property Alias_HorseRef  Auto  

Faction Property StablesFaction  Auto  
