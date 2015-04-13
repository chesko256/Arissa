Scriptname CW01BanditScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)

	(GetOwningQuest() as CW01Script).checkLocRefTypeAliveCount()

EndEvent
