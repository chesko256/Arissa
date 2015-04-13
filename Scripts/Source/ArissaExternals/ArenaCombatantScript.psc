Scriptname ArenaCombatantScript extends ReferenceAlias  


Event OnInit()
;/     if ((GetOwningQuest() as ArenaCombatQuest).ParentQuest.IsRunning())
	   ; GetActorReference().StartCombat(Game.GetPlayer())
	   ((GetOwningQuest() as ArenaCombatQuest).ParentQuest as ArenaScript).RegisterCombatant(GetReference())
    endif /;
EndEvent

Function TellMainQuestImDown()
	(GetOwningQuest() as ArenaCombatQuest).OpponentDowned()
EndFunction

Event OnEnterBleedout()
	if ((GetOwningQuest() as ArenaCombatQuest).IsBluntedQuest)
		GetActorReference().StopCombat()
		TellMainQuestImDown()
	endif
EndEvent

Event OnDying(Actor akKiller)
	TellMainQuestImDown()
EndEvent
