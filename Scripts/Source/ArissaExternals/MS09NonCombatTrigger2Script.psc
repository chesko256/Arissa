Scriptname MS09NonCombatTrigger2Script extends ReferenceAlias  




Event OnTriggerEnter(ObjectReference ActionRef)

MS09QuestScript MS09Script = GetOwningQuest() as MS09QuestScript

	if ActionRef == Game.GetPlayer()
		if MS09script.MS09NonCombat == 1
			MS09Script.MS09NonCombat = -1

		endif
	endif

EndEvent