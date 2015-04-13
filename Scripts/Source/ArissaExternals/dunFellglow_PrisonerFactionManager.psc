scriptName dunFellglow_PrisonerFactionManager extends ObjectReference
{Event manager for the vampire prisoners in Fellglow Keep. When their doors are open, they attack the Warlocks (not the player).}

;The prisoners.
ObjectReference property Actor01 Auto
ObjectReference property Actor02 Auto
ObjectReference property Actor03 Auto

;Prisoner faction shared by the prisoners.
Faction property PrisonerFaction Auto

;Are all of the nearby warlocks dead?
bool warlocksDead

;Has the player released the prisoners?
bool released

;Update the state of this script when all the Warlocks have been killed.
Function SetWarlocksDead()
	warlocksDead = True
	if (released)
		(Actor01 as Actor).EvaluatePackage()
		(Actor02 as Actor).EvaluatePackage()
		(Actor03 as Actor).EvaluatePackage()
	EndIf
EndFunction

;When the vampires are released, update their packages.
Auto State PreActivation
	Event OnActivate(ObjectReference Obj)	
		if (!released && !Actor01.IsDisabled())
			released = True

			;Disable the LinkedRef that was keeping them from engaging in combat/spectator behavior.
			Self.GetLinkedRef().Disable()
			
			(Actor01 as Actor).EvaluatePackage()
			(Actor02 as Actor).EvaluatePackage()
			(Actor03 as Actor).EvaluatePackage()
		EndIf
	endEvent
EndState

STATE PostActivation
	;Do nothing
EndState