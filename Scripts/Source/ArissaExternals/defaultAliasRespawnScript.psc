Scriptname defaultAliasRespawnScript extends ReferenceAlias  
{script for simple respawning of an alias

 Use with defaultQuestRespawnScript
}


function RespawnIfDead()
; 	debug.trace(self + " RespawnIfDead")
	if GetActorRef().IsDead()
		defaultQuestRespawnScript myQuest = GetOwningQuest() as defaultQuestRespawnScript
		gotoState("respawning")
		myQuest.Respawn(self)
		gotoState("normal")
	else
; 		debug.trace(self + "RespawnIfDead: I'm not dead - " + GetActorRef() + ".IsDead()=" + GetActorRef().IsDead())
	endif
endFunction


auto state normal

Event OnDeath(Actor akKiller)
	if bRespawningOn
		defaultQuestRespawnScript myQuest = GetOwningQuest() as defaultQuestRespawnScript
		gotoState("respawning")
		myQuest.TryToRespawn(self)
		gotoState("normal")
	endif
endEvent

endState

state respawning

Event OnDeath(Actor akKiller)
endEvent

endState

bool Property bRespawningOn = true Auto  
{set to false to stop this alias from auto-respawning when it dies
defaults to TRUE}
