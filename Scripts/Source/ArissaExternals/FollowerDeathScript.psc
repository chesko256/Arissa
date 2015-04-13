ScriptName FollowerDeathScript extends ReferenceAlias


DialogueFollowerScript Property DialogueFollower Auto

Event OnDeath(Actor akKiller)

	DialogueFollower.DismissFollower()
	
EndEvent