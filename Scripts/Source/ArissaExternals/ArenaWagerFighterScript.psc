Scriptname ArenaWagerFighterScript extends ReferenceAlias  



Event OnEnterBleedout()
    ; ((GetOwningQuest() as ArenaWagerFighterQuestScript).ParentQuest as ArenaScript).CombatOver()
EndEvent

Event OnDeath(Actor akKiller)
    ; ((GetOwningQuest() as ArenaWagerFighterQuestScript).ParentQuest as ArenaScript).CombatOver()
EndEvent


