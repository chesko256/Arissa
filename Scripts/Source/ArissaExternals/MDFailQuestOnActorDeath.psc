Scriptname MDFailQuestOnActorDeath extends ReferenceAlias  
{This script will cause the quest to fail when the actor in this alias is killed}

Event OnDeath(Actor akKiller)
GetOwningQuest().SetStage(300)
endEvent
