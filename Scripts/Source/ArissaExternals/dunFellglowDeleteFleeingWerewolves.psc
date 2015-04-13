scriptName dunFellglowDeleteFleeingWerewolves extends ObjectReference
{Script for a trigger near the entrance of FellglowKeep01. If any of the fleeing vampire prisoners reach this trigger, delete them.}

Faction property WerewolfFaction Auto

Event onTriggerEnter(objectReference obj)
	if ((obj As Actor).IsInFaction(WerewolfFaction))
		(obj As Actor).SetAlpha(0, True)   ;Need to SetAlpha here instead of disabling them, since these Werewolves are EnableParented.
		obj.Delete()
	EndIf
EndEvent