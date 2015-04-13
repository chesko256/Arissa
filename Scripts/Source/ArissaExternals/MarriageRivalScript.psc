ScriptName MarriageRivalScript Extends ReferenceAlias

Event OnUpdate()
; 	debug.trace("MarriageRivalScript: OnUpdate")
	actor pActor = GetActorRef()
	if pActor.IsInCombat() == 0 && pActor.IsDead() == 0
; 		debug.trace(self + " is no longer in combat, removing player from special combat faction")
		GetOwningQuest().SetStage(200)
	endif
endEvent