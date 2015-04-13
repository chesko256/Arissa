ScriptName MS02EscapeNeposForswornScript Extends ReferenceAlias

Event OnDeath(Actor akKiller)
	If GetOwningQuest().GetStage() == 10
		(GetOwningQuest() as MS02EscapeNeposEndingScript).fForswornOnDeath()
	EndIf
EndEvent