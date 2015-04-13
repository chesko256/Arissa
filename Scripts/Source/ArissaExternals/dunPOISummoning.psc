scriptName dunPOISummoning extends Actor
{Summon event for a POI. When the actor enters combat, activate Actors 1-5. When the actor is killed, kill them.}

ObjectReference property Actor1 Auto
ObjectReference property Actor2 Auto
ObjectReference property Actor3 Auto
ObjectReference property Actor4 Auto
ObjectReference property Actor5 Auto
bool property KillOnDeath = True Auto

;When combat starts, 'summon' in the Atronachs and update the quest.
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if (aeCombatState != 0) ; 0 = not in combat, so non-zero means we entered combat
		if (Actor1 != None)
			Actor1.Activate(Self)
		EndIf
		if (Actor2 != None)
			Actor2.Activate(Self)
		EndIf
		if (Actor3 != None)
			Actor3.Activate(Self)
		EndIf
		if (Actor4 != None)
			Actor4.Activate(Self)
		EndIf
		if (Actor5 != None)
			Actor5.Activate(Self)
		EndIf
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
	if (Actor1 != None)
		if (KillOnDeath)
			(Actor1 as Actor).Kill(Self)
		Else
			(Actor1 as defaultFakeSummonSpell).Banish()
		EndIf
	EndIf
	if (Actor2 != None)
		if (KillOnDeath)
			(Actor2 as Actor).Kill(Self)
		Else
			(Actor2 as defaultFakeSummonSpell).Banish()
		EndIf
	EndIf
	if (Actor3 != None)
		if (KillOnDeath)
			(Actor3 as Actor).Kill(Self)
		Else
			(Actor3 as defaultFakeSummonSpell).Banish()
		EndIf
	EndIf
	if (Actor4 != None)
		if (KillOnDeath)
			(Actor4 as Actor).Kill(Self)
		Else
			(Actor4 as defaultFakeSummonSpell).Banish()
		EndIf
	EndIf
	if (Actor5 != None)
		if (KillOnDeath)
			(Actor5 as Actor).Kill(Self)
		Else
			(Actor5 as defaultFakeSummonSpell).Banish()
		EndIf
	EndIf
EndEvent