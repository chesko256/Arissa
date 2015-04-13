Scriptname CWAttackCityDragonReachDoor extends ReferenceAlias  

Actor Property GalmarRef Auto
Actor Property RalofRef Auto

Faction Property CWImperialFaction Auto

Event OnActivate(ObjectReference akActionRef)

	Actor PlayerRef = Game.GetPlayer()

	if akActionRef == PlayerRef
	
		;temporarily add them to the Imperial faction so the stop combat prevents people from following them into the castle
		;remove them in CWAttackCityConfrontationTriggerScript so the people inside the castle will agro on them
	
		PlayerRef.AddToFaction(CWImperialFaction)
		GalmarRef.AddToFaction(CWImperialFaction)
		RalofRef.AddToFaction(CWImperialFaction)
	
		PlayerRef.StopCombatAlarm()
		GalmarRef.StopCombatAlarm()
		RalofRef.StopCombatAlarm()

		
	EndIf

EndEvent
