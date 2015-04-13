Scriptname ArenaSpawnPointScript extends ReferenceAlias  


Event OnInit()
;/     if ((GetOwningQuest() as ArenaCombatQuest).ParentQuest.IsRunning())
	   ((GetOwningQuest() as ArenaCombatQuest).ParentQuest as ArenaScript).RegisterSpawnPoint(GetReference())
    endif /;
EndEvent
