Scriptname DB09BridgeDoorCrimeStopScript extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)

Game.GetPlayer().StopCombatAlarm()
HaafingarFaction.SetPlayerEnemy(False)

EndEvent

Faction Property HaafingarFaction  Auto  
