Scriptname SvenScript extends ReferenceAlias

Faction Property BardSingerFaction  Auto  

Event OnLocationChange(Location ExitLocation, Location EnterLocation)
	If EnterLocation == SleepingGiantInn
		GetActorRef().SetFactionRank(BardSingerFaction, 1)
	Else
		GetActorRef().SetFactionRank(BardSingerFaction, -1)
	EndIf
EndEvent




Location Property SleepingGiantInn  Auto  
