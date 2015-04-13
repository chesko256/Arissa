Scriptname WinterholdJailTriggerScript extends ObjectReference  



Faction Property PlayerFaction  Auto  

Faction Property WinterholdJailFaction  Auto  

ObjectReference Property WinterholdJailEXtAtronachRef Auto

Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		WinterholdJailFaction.SetEnemy(PlayerFaction)
		WinterholdJailExtAtronachRef.Enable()
	endif


EndEvent

