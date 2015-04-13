Scriptname CW01BIceWraithScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)

	(GetOwningQuest() as CW01BScript).checkLocRefTypeAliveCount()

EndEvent
