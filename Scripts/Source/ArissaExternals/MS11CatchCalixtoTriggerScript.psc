Scriptname MS11CatchCalixtoTriggerScript extends ObjectReference  

Quest Property MS11 auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer() && (MS11 as MS11QuestScript).SiegeOfWindhelmTakingPlace == False)
; 		Debug.Trace("MS11: Player entering murder zone.")
		(MS11 as MS11QuestScript).PlayerInMurderZone = True
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer() && (MS11 as MS11QuestScript).SiegeOfWindhelmTakingPlace == False)
; 		Debug.Trace("MS11: Player leaving murder zone.")
		(MS11 as MS11QuestScript).PlayerInMurderZone = False
	endif
EndEvent
